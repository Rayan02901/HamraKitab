using System.ComponentModel.DataAnnotations;

namespace HamraKitab.Models.DTO
{
    public class LoginRequestDto
    {
        [Required]
        public string UserIdentifier { get; set; }

        //[Required]
        //[DataType(DataType.EmailAddress)]
        //public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }    
    }
}
