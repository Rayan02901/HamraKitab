using HamraKitab.Models;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

public class Book
{
    [Key]
    public Guid Id { get; set; }
    [Required]
    [StringLength(200)]
    public string Title { get; set; }
    [Required]
    [StringLength(200)]
    public string Author { get; set; }
    [Required]
    public DateTime PublishedDate { get; set; }
    [StringLength(2000)]
    public string? Description { get; set; }
    [Range(0, 5)]
    [Column(TypeName = "decimal(3,2)")]
    public decimal? Rating { get; set; }
    [Range(0, int.MaxValue)]
    public int? Price { get; set; }

    // Audit fields
    public DateTime CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }

    // Foreign keys
    [Required]
    public string UserId { get; set; }

    // Navigation properties
    [ForeignKey("UserId")]
    public virtual ApplicationUser User { get; set; }
    public virtual ICollection<BookGenre> BookGenres { get; set; }
    public virtual ICollection<Review> Reviews { get; set; }
    public virtual ICollection<Activity> Activities { get; set; }
    public virtual ICollection<Recommendation> Recommendations { get; set; }

    public Book()
    {
        BookGenres = new HashSet<BookGenre>();
        Reviews = new HashSet<Review>();
        Activities = new HashSet<Activity>();
        Recommendations = new HashSet<Recommendation>();
        CreatedAt = DateTime.UtcNow;
    }
}