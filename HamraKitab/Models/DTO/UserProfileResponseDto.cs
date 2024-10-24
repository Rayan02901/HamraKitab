
using System;
using System.Collections.Generic;
using System.Linq;

namespace HamraKitab.Models.DTO
{
    public class UserProfileResponseDto
    {
        public Guid ProfileId { get; set; } // Unique identifier for the user profile

        public string FullName { get; set; } // Full name of the user

        public string Bio { get; set; } // A short description or bio of the user

        public List<UserProfilePhoto> UserProfilePhotos { get; set; }

        public DateTime CreatedAt { get; set; } // Profile creation date

        public List<ActivityDto> Activities { get; set; } = new List<ActivityDto>(); // Collection of user activities

        public List<FriendDto> Friends { get; set; } = new List<FriendDto>(); // Collection of friends

        // Calculated property for favorite books based on a specific ActionId
        public IEnumerable<string> FavoriteBooks => Activities
            .Where(a => a.ActionId == Guid.Parse("b11ac0d4-ff79-4024-bcd5-32bf2e6d252d")) // Filter by specific ActionId for favorite action
            .Select(a => a.Book.Title) // Assuming ActivityDto has a Book property with Title
            .Distinct();
    }
}
