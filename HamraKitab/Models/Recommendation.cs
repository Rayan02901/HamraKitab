using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace HamraKitab.Models
{
    public class Recommendation
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public string UserId { get; set; }
        [ForeignKey(nameof(UserId))]
        public virtual ApplicationUser User { get; set; }

        [Required]
        public Guid BookId { get; set; }
        [ForeignKey(nameof(BookId))]
        public virtual Book Book { get; set; }

    }
}
