using System.ComponentModel.DataAnnotations;
namespace HamraKitab.Models.DTO
{
    public class ActivityCreateDto
    {
        [Required]
        public string UserId { get; set; }

        [Required]
        public Guid BookId { get; set; }

        [Required]
        public Guid ActionId { get; set; }
    }
}
