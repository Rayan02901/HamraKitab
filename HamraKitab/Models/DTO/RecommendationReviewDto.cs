namespace HamraKitab.Models.DTO
{
    
        public class RecommendationReviewDto
        {
            public string UserId { get; set; }
            public Guid BookId { get; set; }
            public double Rating { get; set; }
        }
    
}
