using Microsoft.AspNetCore.Http;
using System.ComponentModel.DataAnnotations;
using HamraKitab.Validation.Attributes;

namespace HamraKitab.Models.DTO
{
    public class UserProfileRequestDto
    {
        [Required]
        [StringLength(100)]
        public string FullName { get; set; }

        [StringLength(500)]
        public string? Bio { get; set; }

        // Limit file size and type
        [MaxFileSize(5 * 1024 * 1024)] // 5MB
        [AllowedExtensions(new string[] { ".jpg", ".jpeg", ".png" })]
        public IFormFile? Photo { get; set; } // Profile photo file uploaded by the user
    }
}
