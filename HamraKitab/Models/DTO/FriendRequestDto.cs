using System;

namespace HamraKitab.DTOs
{
    public class FriendRequestDto
    {
        public Guid FriendRequestId { get; set; }
        public string RequesterId { get; set; }
        public string RequesterUsername { get; set; }  // Added field for requester's username
        public string RequesterFullName { get; set; }  // Added field for requester's full name
        public string RecipientId { get; set; }
        public DateTime CreatedAt { get; set; }
        public bool IsAccepted { get; set; }
    }
}
