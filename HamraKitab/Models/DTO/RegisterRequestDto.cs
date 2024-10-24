using System.ComponentModel.DataAnnotations;

namespace HamraKitab.Models.DTO
{
    public enum UserRole
    {
        User,
        Admin
    }
    public class RegisterRequestDto
    {
        [Required]
        public string UserName { get; set; }

        [Required]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; } 

        public string Role { get; set; }
        
    }
}
