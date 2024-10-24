
using HamraKitab.Models.DTO;

namespace HamraKitab.Models.DTO
{
    public class BookResponseDto
    {
        public Guid Id { get; set; }
        public string Title { get; set; }
        public string Author { get; set; }
        public string GenreName { get; set; }
        public DateTime PublishedDate { get; set; }
        public string? Description { get; set; }
        public decimal? Rating { get; set; }
        public int? Price { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
        public string UserName { get; set; }
        public List<ReviewDto> Reviews { get; set; }
    }
}
