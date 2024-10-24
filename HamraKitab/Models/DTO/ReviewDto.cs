using System;
namespace HamraKitab.Models.DTO

{
    public class ReviewDto
    {
        public Guid ReviewId { get; set; }
        public string Content { get; set; }
        public int Rating { get; set; }
        public string ReviewerName { get; set; } // If needed
    }
}
