using System;

namespace HamraKitab.DTOs
{
    public class FriendRequestDto
    {
        public Guid FriendRequestId { get; set; }
        public string RequesterId { get; set; }
        public string RecipientId { get; set; }
        public DateTime CreatedAt { get; set; }
        public bool IsAccepted { get; set; }
    }
}
