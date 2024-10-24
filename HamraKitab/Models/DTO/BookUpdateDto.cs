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
        public Guid GenreId { get; set; }

        [Required]
        public DateTime PublishedDate { get; set; }

        [StringLength(2000)]
        public string? Description { get; set; }

        [Range(0, int.MaxValue)]
        public int? Price { get; set; }
        
    }
}
