// UserProfile.cs
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace HamraKitab.Models
{
    public class UserProfile
    {
        [Key]
        public Guid ProfileId { get; set; }

        [Required]
        [StringLength(100)]
        public string FullName { get; set; }

        [StringLength(500)]
        public string? Bio { get; set; }

        [Required]
        public string UserId { get; set; }

        [Required]
        public DateTime CreatedAt { get; set; }

        public DateTime? UpdatedAt { get; set; }

        // Navigation properties
        [ForeignKey("UserId")]
        public virtual ApplicationUser User { get; set; }

        [JsonIgnore]
        public virtual ICollection<UserProfilePhoto> UserProfilePhotos { get; set; }
        public virtual ICollection<Activity> Activities { get; set; }
        public virtual ICollection<Friend> Friends { get; set; }

        [NotMapped]
        public IEnumerable<Book> FavoriteBooks { get; private set; }

        public UserProfile()
        {
            UserProfilePhotos = new HashSet<UserProfilePhoto>();
            Activities = new HashSet<Activity>();
            Friends = new HashSet<Friend>();
            CreatedAt = DateTime.UtcNow;
        }
    }
}