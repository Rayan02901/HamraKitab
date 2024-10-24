using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace HamraKitab.Models
{
    public class UserProfilePhoto
    {
        [Key]
        public Guid PhotoId { get; set; }

        [Required]
        [StringLength(500)]
        public string PhotoUrl { get; set; }

        [Required]
        public Guid ProfileId { get; set; }

        public bool IsMainPhoto { get; set; }

        public DateTime UploadedAt { get; set; }

        [ForeignKey("ProfileId")]
        public virtual UserProfile UserProfile { get; set; }

        public UserProfilePhoto()
        {
            UploadedAt = DateTime.UtcNow;
        }


    }
}