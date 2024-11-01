using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace HamraKitab.Models
{
    public class Genre
    {
        [Key]
        public Guid GenreId { get; set; }

        [Required]
        [StringLength(50)]
        public string GenreName { get; set; }

        // Navigation property
        [JsonIgnore]
        public virtual ICollection<Book> Books { get; set; }
        [JsonIgnore]
        public virtual ICollection<BookGenre> BookGenres { get; set; }

        public Genre()
        {
            Books = new HashSet<Book>();
        }
    }

}
