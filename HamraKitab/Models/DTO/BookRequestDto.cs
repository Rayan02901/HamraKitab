namespace HamraKitab.Models.DTO
{
    public class BookRequestDto
    {
        public string Title { get; set; }          // Title of the book
        public string Author { get; set; }         // Author of the book
        public string Genre { get; set; }          // Genre (e.g., Fiction, Thriller, etc.)
        public DateTime PublishedDate { get; set; } // Date when the book was published
        public string? Description { get; set; }    // Short description or summary of the book
        public double? Rating { get; set; }         // Average rating of the book
        public int? Price { get; set; }
    }
}
