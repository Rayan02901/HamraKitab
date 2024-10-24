namespace HamraKitab.Models.DTO
{
    public class ActivityResponseDto
    {
        public Guid ActivityId { get; set; }
        public string UserId { get; set; }
        public string UserName { get; set; }
        public Guid BookId { get; set; }
        public string BookTitle { get; set; }
        public Guid ActionId { get; set; }
        public string ActionName { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}
