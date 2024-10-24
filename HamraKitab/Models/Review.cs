using System.ComponentModel.DataAnnotations;

namespace HamraKitab.Models
{
    // Review.cs
    public class Review
    {
        [Key]
        public Guid ReviewId { get; set; }

        [Required]
        [StringLength(2000)]
        public string Comment { get; set; }

        [Required]
        [Range(1, 5)]
        public int Rating { get; set; }

        public DateTime ReviewDate { get; set; }

        [Required]
        public Guid BookId { get; set; }

        [Required]
        public string UserId { get; set; }

        // Navigation properties
        public virtual Book Book { get; set; }
        public virtual ApplicationUser User { get; set; }

        public Review()
        {
            ReviewDate = DateTime.UtcNow;
        }
    }
}
