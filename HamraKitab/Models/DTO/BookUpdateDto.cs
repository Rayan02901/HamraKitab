using System.ComponentModel.DataAnnotations;

namespace HamraKitab.Models.DTO
{
    public class BookUpdateDto
    {
        [Required]
        [StringLength(200)]
        public string Title { get; set; }

        [Required]
        [StringLength(200)]
        public string Author { get; set; }

        [Required]
        public List<Guid> GenreIds { get; set; }  // List of Genre IDs for multiple genres

        [Required]
        public DateTime PublishedDate { get; set; }

        [StringLength(2000)]
        public string? Description { get; set; }

        [Range(0, int.MaxValue)]
        public int? Price { get; set; }

        public BookUpdateDto()
        {
            GenreIds = new List<Guid>();  // Initialize the GenreIds list
        }
    }
}
