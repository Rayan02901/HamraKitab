from ssl_context import get_session
from config import API_CONFIG
import requests
import json
import numpy as np
from typing import List, Optional
from dataclasses import dataclass
from sklearn.metrics.pairwise import cosine_similarity
import ssl
import urllib3

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)
@dataclass
class UserActivity:
    userId: str
    bookIds: List[str]

class UserActivityFetcher:
    def __init__(self):
        self.base_url = API_CONFIG['base_url']
        self.session = get_session()

    def fetch_user_activities(self, min_book_count: int = 5) -> Optional[List[UserActivity]]:
        url = f"{self.base_url}/api/Activity/user-book-activities"
        params = {'minBookCount': min_book_count}
        
        try:
            response = requests.get(url, params=params, verify=False)
            
            if response.status_code == 200:
                return [UserActivity(**user_data) for user_data in response.json()]
            else:
                print(f"Error: Status code {response.status_code}")
                print(f"Response: {response.text}")
                return None
        except requests.exceptions.RequestException as e:
            print(f"Request failed: {str(e)}")
            return None

    def recommend_books(self, user: UserActivity, genre_matrix_file: str, top_n: int = 5) -> List[dict]:
        """
        Recommend books for a user based on cosine similarity.
        """
        print(f"Loading genre matrix from {genre_matrix_file}...")
        data = np.load(genre_matrix_file)
        
        # Load data using the correct keys
        genre_matrix = data['genre_matrix']  # Genre feature matrix
        book_indices = data['book_indices']  # Book IDs and their indices
        book_titles = data['book_titles']    # Book titles
        
        # Extract just the book IDs (first column)
        book_ids = book_indices[:, 0]
        
        # Create a mapping from book ID to index
        book_id_to_index = {book_id: idx for idx, book_id in enumerate(book_ids)}
        
        # Find indices for user's books
        user_book_indices = []
        for user_book_id in user.bookIds:
            if user_book_id in book_id_to_index:
                user_book_indices.append(book_id_to_index[user_book_id])
            else:
                print(f"Warning: Book ID {user_book_id} not found in genre matrix")
        
        if not user_book_indices:
            print(f"No matching books found for user {user.userId} in the genre matrix.")
            return []
        
        print(f"Found {len(user_book_indices)} matching books for user {user.userId}")
        
        # Calculate user's genre preferences
        user_genre_vector = np.mean(genre_matrix[user_book_indices], axis=0).reshape(1, -1)
        
        # Compute cosine similarity
        similarity_scores = cosine_similarity(user_genre_vector, genre_matrix)[0]
        
        # Rank books by similarity, excluding user's already-read books
        similar_books_idx = np.argsort(-similarity_scores)
        recommendations = []
        
        for idx in similar_books_idx:
            book_id = str(book_ids[idx])  # Convert to string to ensure JSON serializable
            if book_id not in user.bookIds:
                # Convert numpy array to string and clean up the title
                title = str(book_titles[idx])
                # Remove array formatting if present
                title = title.strip('[]\'').split('\\n')[0].strip()
                
                recommendations.append({
                    'bookId': book_id,
                    'title': title,
                    'similarity_score': float(similarity_scores[idx])
                })
                if len(recommendations) >= top_n:
                    break
        
        return recommendations

    def display_user_stats(self, users: List[UserActivity]) -> None:
        if not users:
            print("No user data to display")
            return

        print("\nUser Activity Statistics:")
        print(f"Total users: {len(users)}")
        
        book_counts = [len(user.bookIds) for user in users]
        avg_books = sum(book_counts) / len(book_counts)
        max_books = max(book_counts)
        min_books = min(book_counts)
        
        print(f"\nStatistics:")
        print(f"Average books per user: {avg_books:.2f}")
        print(f"Maximum books for a user: {max_books}")
        print(f"Minimum books for a user: {min_books}")
        
        print("\nDetailed User Information:")
        for user in users:
            print(f"\nUser ID: {user.userId}")
            print(f"Number of books: {len(user.bookIds)}")
            print("Sample of book IDs (up to 5):")
            for book_id in user.bookIds[:5]:
                print(f"  - {book_id}")

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

def main():
    fetcher = UserActivityFetcher()
    genre_matrix_file = "genre_matrix.npz"
    session = get_session()
    
    print("Fetching user activity data...")
    min_book_counts = [5, 10]
    
    for min_count in min_book_counts:
        print(f"\nFetching users with minimum {min_count} books:")
        users = fetcher.fetch_user_activities(min_book_count=min_count)
        
        if users:
            fetcher.display_user_stats(users)
            
            for user in users:
                print(f"\nGenerating recommendations for User ID: {user.userId}")
                recommendations = fetcher.recommend_books(user, genre_matrix_file, top_n=5)
                
                if recommendations:
                    add_response = session.delete(
                            f'https://localhost:5000/api/Recommendation/all?userId={user.userId}',
                            headers={'accept': '*/*'},
                            verify=False  # Note: verify=False only for local testing
                        )
                    if add_response.status_code == 200:
                        print("  Recommendation deleted successfully.")
                    else:
            
                        print(f"  Failed to delete recommendation for User ID: {user.userId}")
                    print(f"\nRecommended books for User {user.userId}:")
                    for rec in recommendations:
                        print(f"  - {rec['title']} (ID: {rec['bookId']}, Similarity: {rec['similarity_score']:.3f})")
                        # Hit the Recommendation/add API
                        # Hit the Recommendation/add API
                        
                        # Hit the Recommendation/add API
                        add_response = requests.post(
                            f'https://localhost:5000/api/Recommendation/add?userId={user.userId}&bookId={rec['bookId']}',
                            headers={'accept': '*/*'},
                            verify=False  # Note: verify=False only for local testing
                        )
                        if add_response.status_code == 200:
                            print("  Recommendation added successfully.")
                        else:
                            print(f"  Failed to add recommendation for Book ID: {rec['bookId']}")
            
             
            
                
                    # Save recommendations to a file
                    output_filename = f"user_{user.userId}_recommendations.json"
                    with open(output_filename, 'w') as f:
                        json.dump({
                            "userId": user.userId,
                            "recommendations": recommendations
                        }, f, indent=2)
                    print(f"Saved recommendations to '{output_filename}'")
                else:
                    print(f"No recommendations generated for User {user.userId}")
        else:
            print(f"No users found with minimum {min_count} books")

if __name__ == "__main__":
    main()