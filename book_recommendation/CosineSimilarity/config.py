# config.py
API_CONFIG = {
    'base_url': 'https://localhost:5000',
    'endpoints': {
        'books_genres': '/api/Recommendation/books-with-genres',
        'user_stats': '/api/Activity/user-book-stats',
        'recommendations': '/api/Recommendation'
    }
}

RECOMMENDATION_CONFIG = {
    'min_books': 5,
    'num_recommendations': 20,
    'page_size': 10
}