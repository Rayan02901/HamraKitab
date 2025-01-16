namespace HamraKitab.Models
{
    public class BookGenre
    {
        public Guid BookId { get; set; }
        public Guid GenreId { get; set; }

        // Navigation properties
        public virtual Book Book { get; set; }
        public virtual Genre Genre { get; set; }
    }
}