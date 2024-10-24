using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HamraKitab.Models
{
    public class Activity
    {
        [Key]
        public Guid ActivityId { get; set; }

        [Required]
        public string UserId { get; set; }

        [Required]
        public Guid BookId { get; set; }

        [Required]
        public Guid ActionId { get; set; }

        [Required]
        public DateTime CreatedAt { get; set; }

        // Navigation properties
        [ForeignKey("UserId")]
        public virtual ApplicationUser User { get; set; }

        [ForeignKey("BookId")]
        public virtual Book Book { get; set; }

        [ForeignKey("ActionId")]
        public virtual Action Action { get; set; }

        public Activity()
        {
            CreatedAt = DateTime.UtcNow;
        }
    }
}