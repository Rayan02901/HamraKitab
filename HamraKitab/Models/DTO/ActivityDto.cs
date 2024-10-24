using HamraKitab.Models.DTO;
namespace HamraKitab.Models.DTO
{
    public class ActivityDto
    {
        public Guid ActivityId { get; set; }
        public string UserId { get; set; }
        public Guid BookId { get; set; }
        public Guid ActionId { get; set; }
        public DateTime CreatedAt { get; set; }
        public BookDto Book { get; set; }
        public ActionDto Action { get; set; }
    }
}
