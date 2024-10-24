using System;

namespace HamraKitab.Models
{
    public class Friend
    {
        public Guid FriendId { get; set; }

        public string UserId { get; set; }
        public virtual ApplicationUser User { get; set; }

        public string FriendUserId { get; set; }
        public virtual ApplicationUser FriendUser { get; set; }

        public DateTime CreatedAt { get; set; }
    }
}
