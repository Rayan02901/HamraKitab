﻿namespace HamraKitab.Models.DTO
{
    public class LoginResponseDto
    {
        public string JwtToken { get; set; }
        
        public string Role { get; set; }
        public string UserId { get; set; }
    }
}
