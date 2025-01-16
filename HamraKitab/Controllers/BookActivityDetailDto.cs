namespace HamraKitab.Controller
{
    public class BookActivityDetailDto
    {
        public Guid BookId { get; set; }
        public string BookTitle { get; set; }
        public int ActivityCount { get; set; }
        public DateTime LastActivity { get; set; }
    }
}
