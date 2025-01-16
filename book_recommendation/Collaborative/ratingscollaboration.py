import pandas as pd
import numpy as np
from scipy.sparse import csr_matrix, save_npz, load_npz
from sklearn.neighbors import NearestNeighbors
import requests
import ssl
import urllib3

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

class GuidBookRecommender:
    def __init__(self):
        self.ratings_df = None
        self.book_sparse_matrix = None
        self.model = None
        self.book_id_to_index = None
        self.index_to_book_id = None
        self.user_ids = set()  # Store unique user IDs

    def load_data(self, ratings_path, save_matrix_path=None):
        """Load ratings data from CSV file and process it"""
        self.ratings_df = pd.read_csv(ratings_path, names=['book_id', 'user_id', 'rating'])
        self.ratings_df['rating'] = pd.to_numeric(self.ratings_df['rating'], errors='coerce')
        self.ratings_df = self.ratings_df.dropna(subset=['rating'])

        # Create mappings for book GUIDs to indices
        unique_books = self.ratings_df['book_id'].unique()
        self.book_id_to_index = {book_id: idx for idx, book_id in enumerate(unique_books)}
        self.index_to_book_id = {idx: book_id for book_id, idx in self.book_id_to_index.items()}

        # Create user mapping
        unique_users = self.ratings_df['user_id'].unique()
        user_map = {id_: idx for idx, id_ in enumerate(unique_users)}

        # Map IDs to indices for sparse matrix
        user_indices = [user_map[id_] for id_ in self.ratings_df['user_id']]
        book_indices = [self.book_id_to_index[id_] for id_ in self.ratings_df['book_id']]

        # Create the sparse matrix
        self.book_sparse_matrix = csr_matrix((
            self.ratings_df['rating'].values,
            (book_indices, user_indices)
        ))

        # Save sparse matrix if save_matrix_path is provided
        if save_matrix_path:
            save_npz(save_matrix_path, self.book_sparse_matrix)

        # Initialize the model
        self.model = NearestNeighbors(metric='cosine', algorithm='brute')
        self.model.fit(self.book_sparse_matrix.T)

    def get_recommendations(self, user_ratings, n_recommendations=10):
        """Get book recommendations based on user ratings"""
        if len(user_ratings) == 0:
            return []

        # Create user vector
        user_vector = np.zeros(self.book_sparse_matrix.shape[0])
        for book_id, rating in user_ratings.items():
            if book_id in self.book_id_to_index:
                user_vector[self.book_id_to_index[book_id]] = rating

        # Find similar users
        distances, indices = self.model.kneighbors(
            user_vector.reshape(1, -1),
            n_neighbors=5
        )

        # Get weighted average of ratings from similar users
        similar_users_matrix = self.book_sparse_matrix[:, indices.flatten()]
        weights = 1 - distances.flatten()
        weighted_ratings = np.sum(similar_users_matrix.multiply(weights), axis=1) / np.sum(weights)

        # Get top book indices excluding already rated books
        rated_book_indices = {self.book_id_to_index[book_id]
                              for book_id in user_ratings.keys()
                              if book_id in self.book_id_to_index}
        book_ratings = [(i, r) for i, r in enumerate(weighted_ratings)
                        if i not in rated_book_indices]
        book_ratings.sort(key=lambda x: x[1], reverse=True)

        return [self.index_to_book_id[book_id]
                for book_id, _ in book_ratings[:n_recommendations]]

    def save_sparse_matrix(self, save_matrix_path):
        """Save sparse matrix to file"""
        if self.book_sparse_matrix is not None:
            save_npz(save_matrix_path, self.book_sparse_matrix)
        else:
            print("Sparse matrix is not yet initialized.")

# SSL context and session management for requests
def create_ssl_context():
    ssl_context = ssl.create_default_context()
    ssl_context.check_hostname = False
    ssl_context.verify_mode = ssl.CERT_NONE
    return ssl_context

def get_session():
    session = requests.Session()
    session.verify = create_ssl_context()  # Use the custom SSL context

    session.verify = False  # Disable SSL verification for all requests
    requests.packages.urllib3.disable_warnings(requests.packages.urllib3.exceptions.InsecureRequestWarning)
    return session

def get_api_recommendations():
    """Fetch recommendations from the API"""
    try:
        response = requests.get('https://localhost:5000/api/Review/recommendations',
                                verify=False)  # Note: verify=False only for local testing
        if response.status_code == 200:
            return response.json()
        else:
            print(f"Error fetching recommendations: {response.status_code}")
            return None
    except Exception as e:
        print(f"API request failed: {str(e)}")
        return None

def process_recommendations():
    """Process recommendations from API and generate book suggestions."""
    recommender = GuidBookRecommender()
    user_book_info = []  # Array to store UserId, BookId, Title, and Author

    try:
        print("Loading recommendation system...")
        # Update the path to your CSV file
        recommender.load_data("filtered_ratings.csv", save_matrix_path="book_sparse_matrix.npz")

        # Get recommendations from API
        session = get_session()
        api_data = get_api_recommendations()
        if not api_data:
            return

        # Process recommendations by user
        user_ratings = {}
        for rating_data in api_data:
            user_id = rating_data['userId']
            recommender.user_ids.add(user_id)  # Store the user ID

            if user_id not in user_ratings:
                user_ratings[user_id] = {}

            user_ratings[user_id][rating_data['bookId']] = rating_data['rating']

        # Generate and display recommendations for each user
        print("\nRecommendations for Users:")
        for user_id, ratings in user_ratings.items():
            print(f"\nUser ID: {user_id}")
            recommended_books = recommender.get_recommendations(ratings)
            print("Recommended Books:")

            for book_id in recommended_books:
                print(f"- {book_id}")

                # Fetch additional details about the book from the API
                try:
                    response = requests.get(
                        f'https://localhost:5000/api/Book/{book_id}',
                        headers={'accept': 'text/plain'},
                        verify=False  # Note: verify=False only for local testing
                    )
                    if response.status_code == 200:
                        book_data = response.json()
                        title = book_data.get('title', 'Unknown Title')
                        author = book_data.get('author', 'Unknown Author')

                        # Add data to the array
                        user_book_info.append({
                            'UserId': user_id,
                            'BookId': book_id,
                            'Title': title,
                            'Author': author
                        })

                        # Print book details
                        print(f"  Title: {title}")
                        print(f"  Author: {author}")

                        # Hit the Recommendation/add API
                        add_response = requests.post(
                            f'https://localhost:5000/api/Recommendation/add?userId={user_id}&bookId={book_id}',
                            headers={'accept': '*/*'},
                            verify=False  # Note: verify=False only for local testing
                        )
                        if add_response.status_code == 200:
                            print("  Recommendation added successfully.")
                        else:
                            print(f"  Failed to add recommendation for Book ID: {book_id}")
                    else:
                        print(f"Failed to fetch details for Book ID: {book_id}")
                except Exception as e:
                    print(f"Error fetching book details for Book ID {book_id}: {str(e)}")

        # Print stored user-book information
        print("\nUser-Book Information:")
        for info in user_book_info:
            print(f"UserId: {info['UserId']}, BookId: {info['BookId']}, Title: {info['Title']}, Author: {info['Author']}")

        # Print stored user IDs
        print("\nStored User IDs:")
        for user_id in recommender.user_ids:
            print(f"- {user_id}")

        # Save the sparse matrix
        recommender.save_sparse_matrix("book_sparse_matrix_saved.npz")

    except Exception as e:
        print(f"An error occurred: {str(e)}")
        

if __name__ == "__main__":
    process_recommendations()
