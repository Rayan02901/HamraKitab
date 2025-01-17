import requests
import json
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.metrics import confusion_matrix, accuracy_score, precision_score, recall_score, f1_score

# Base API URL
base_url = "https://localhost:5000"

# Disable SSL warnings for localhost
import urllib3
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

def fetch_user_activities():
    url = f"{base_url}/api/Activity/all-user-activities"
    headers = {"accept": "text/plain"}
    try:
        response = requests.get(url, headers=headers, verify=False)
        response.raise_for_status()
        activities = response.json()
        print("User Activities:")
        print(json.dumps(activities, indent=4))
        return activities
    except requests.exceptions.RequestException as e:
        print(f"Error fetching user activities: {e}")
        return None

def fetch_recommendations():
    url = f"{base_url}/api/Recommendation"
    headers = {"accept": "*/*"}
    try:
        response = requests.get(url, headers=headers, verify=False)
        response.raise_for_status()
        recommendations = response.json()
        print("Recommendations:")
        print(json.dumps(recommendations, indent=4))
        return recommendations
    except requests.exceptions.RequestException as e:
        print(f"Error fetching recommendations: {e}")
        return None

def fetch_book_list():
    url = f"{base_url}/api/Book/list"
    headers = {"accept": "text/plain"}
    try:
        response = requests.get(url, headers=headers, verify=False)
        response.raise_for_status()
        books = response.json()
        print("\nBook List:")
        print(json.dumps(books, indent=4))
        return books
    except requests.exceptions.RequestException as e:
        print(f"Error fetching book list: {e}")
        return None

def calculate_confusion_matrix(activities, recommendations, all_books):
    # Get sets of book IDs
    activity_books = set()
    for activity in activities:
        activity_books.update(activity["bookIds"])
    
    recommendation_books = set(rec["bookId"] for rec in recommendations["recommendations"])
    all_book_ids = set(book["id"] for book in all_books)
    
    # Calculate confusion matrix components
    tp = len(activity_books.intersection(recommendation_books))  # Books in both
    fp = len(recommendation_books - activity_books)  # Books only in recommendations
    fn = len(activity_books - recommendation_books)  # Books only in activities
    tn = len(all_book_ids - (activity_books.union(recommendation_books)))  # Books in neither
    
    return tp, fp, fn, tn

def plot_confusion_matrix(tp, fp, fn, tn):
    cm = np.array([[tn, fp], [fn, tp]])
    plt.figure(figsize=(8, 6))
    sns.heatmap(cm, annot=True, fmt='d', cmap='Blues',
                xticklabels=['Not Recommended', 'Recommended'],
                yticklabels=['Not in Activities', 'In Activities'])
    plt.title('Confusion Matrix for Book Recommendations')
    plt.ylabel('Actual (Activities)')
    plt.xlabel('Predicted (Recommendations)')
    plt.show()

def calculate_metrics(tp, fp, fn, tn):
    # Calculate metrics
    total = tp + fp + fn + tn
    accuracy = (tp + tn) / total if total > 0 else 0
    precision = tp / (tp + fp) if (tp + fp) > 0 else 0
    recall = tp / (tp + fn) if (tp + fn) > 0 else 0
    f1 = 2 * (precision * recall) / (precision + recall) if (precision + recall) > 0 else 0
    
    return accuracy, precision, recall, f1

def main():
    # Fetch data from all APIs
    user_activities = fetch_user_activities()
    recommendations_data = fetch_recommendations()
    book_list = fetch_book_list()
    
    if user_activities and recommendations_data and book_list:
        # Calculate total number of books
        total_books = len(book_list)
        print(f"\nTotal number of books in the system: {total_books}")
        
        print("\nProcessing data and calculating metrics...\n")
        
        # Calculate confusion matrix components
        tp, fp, fn, tn = calculate_confusion_matrix(user_activities, recommendations_data, book_list)
        
        # Calculate metrics
        accuracy, precision, recall, f1 = calculate_metrics(tp, fp, fn, tn)
        
        # Print detailed analysis
        print("\nConfusion Matrix Components:")
        print(f"True Positives (TP): {tp} - Books in both recommendations and activities")
        print(f"True Negatives (TN): {tn} - Books neither in recommendations nor activities")
        print(f"False Positives (FP): {fp} - Books in recommendations but not in activities")
        print(f"False Negatives (FN): {fn} - Books in activities but not in recommendations")
        
        print("\nPerformance Metrics:")
        print(f"Accuracy: {accuracy:.4f} - Proportion of correct predictions (TP + TN) / Total")
        print(f"Precision: {precision:.4f} - Proportion of correct recommendations (TP / (TP + FP))")
        print(f"Recall: {recall:.4f} - Proportion of actual books recommended (TP / (TP + FN))")
        print(f"F1 Score: {f1:.4f} - Harmonic mean of precision and recall")
        
        # Additional statistics
        print("\nBook Coverage Statistics:")
        activity_books = set()
        for activity in user_activities:
            activity_books.update(activity["bookIds"])
        
        recommendation_books = set(rec["bookId"] for rec in recommendations_data["recommendations"])
        
        print(f"Total Books in System: {total_books}")
        print(f"Books in Activities: {len(activity_books)}")
        print(f"Books in Recommendations: {len(recommendation_books)}")
        print(f"Books in Both: {len(activity_books.intersection(recommendation_books))}")
        print(f"Books in Neither: {tn}")
        
        # Plot confusion matrix
        plot_confusion_matrix(tp, fp, fn, tn)

if __name__ == "__main__":
    main()