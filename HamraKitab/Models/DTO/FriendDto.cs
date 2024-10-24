using System;

namespace HamraKitab.Models.DTO
{
    public class FriendDto
    {
        public Guid FriendId { get; set; }
        public string UserId { get; set; }
        public string FriendUserId { get; set; }
        public DateTime CreatedAt { get; set; }
        public UserDto FriendUser { get; set; }
    }
}
