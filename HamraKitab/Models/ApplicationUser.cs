using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;

namespace HamraKitab.Models
{
    public class ApplicationUser : IdentityUser
    {
        public DateTime CreatedAt { get; set; }

        // Navigation properties
        public virtual ICollection<FriendRequest> SentFriendRequests { get; set; }
        public virtual ICollection<FriendRequest> ReceivedFriendRequests { get; set; }
        public virtual ICollection<Friend> Friends { get; set; }
        public virtual ICollection<Book> Books { get; set; }
        public virtual ICollection<Activity> Activities { get; set; }
        public virtual ICollection<Review> Reviews { get; set; }
        // Add navigation property for UserProfile
        public virtual UserProfile Profile { get; set; }


        public ApplicationUser()
        {
            SentFriendRequests = new HashSet<FriendRequest>();
            ReceivedFriendRequests = new HashSet<FriendRequest>();
            Friends = new HashSet<Friend>();
            Books = new HashSet<Book>();
            Activities = new HashSet<Activity>();
            Reviews = new HashSet<Review>();
        }
    }
}
