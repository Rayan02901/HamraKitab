namespace HamraKitab.Models.DTO
{
    public class BookGenreDto
    {
        public Guid BookId { get; set; }
        public string Title { get; set; }
        public List<string> Genres { get; set; }

        public BookGenreDto()
        {
            Genres = new List<string>();
        }
    }
}
