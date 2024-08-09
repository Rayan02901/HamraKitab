using Amazon.Runtime.Internal.Endpoints.StandardLibrary;

namespace HamraKitab.Models
{
    public class Book
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Author { get; set; }
        public string Language { get; set; }
        public string Genres { get; set; }
        public DateTime ReleaseDate { get; set; }
       
        public string? CoverImage { get; set; }
    }
}
