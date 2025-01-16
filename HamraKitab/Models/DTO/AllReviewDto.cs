namespace HamraKitab.Models.DTO
{
    public class AllReviewDto
    {
        public Guid ReviewId { get; set; }
        public string UserName { get; set; }
        public string UserId { get; set; }  // Added this line
        public Guid BookId { get; set; }  // Added BookId
        public string BookName { get; set; }
        public string Comment { get; set; }
        public int Rating { get; set; }
        public DateTime ReviewDate { get; set; }
        public Guid? ProfileId { get; set; }
    }
}