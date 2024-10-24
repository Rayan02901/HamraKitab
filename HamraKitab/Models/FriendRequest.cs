using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace HamraKitab.Models
{
    public class FriendRequest
    {
        public Guid FriendRequestId { get; set; } // Unique identifier for the friend request

        [ForeignKey("Requester")] // Specify foreign key for the Requester navigation property
        public string RequesterId { get; set; } // User ID of the person sending the request

        [ForeignKey("Recipient")] // Specify foreign key for the Recipient navigation property
        public string RecipientId { get; set; } // User ID of the person receiving the request

        public DateTime CreatedAt { get; set; } // Timestamp for when the request was created
        public bool IsAccepted { get; set; } // Indicates if the request has been accepted

        // Navigation properties
        public ApplicationUser Requester { get; set; } // Navigation property to the Requester
        public ApplicationUser Recipient { get; set; } // Navigation property to the Recipient
    }
}
