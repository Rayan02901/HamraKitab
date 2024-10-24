using Microsoft.AspNetCore.Http;

namespace HamraKitab.Models.DTO
{
    public class UserProfileUpdateDto
    {
        public string FullName { get; set; } // Full name of the user

        public string Bio { get; set; } // A short description or bio of the user

        
    }
}
