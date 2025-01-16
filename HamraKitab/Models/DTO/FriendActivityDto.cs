using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using HamraKitab.Models;
using System.Threading.Tasks;

namespace HamraKitab.Models.DTO
{
    public class FriendActivityDto
    {
        public Guid ActivityId { get; set; }
        public string UserName { get; set; }
        public string UserFullName { get; set; }
        public string ActionName { get; set; }
        public string BookName { get; set; }
        public DateTime ActivityDate { get; set; }
    }

    public class PaginatedResponse<T>
    {
        public IEnumerable<T> Items { get; set; }
        public int TotalPages { get; set; }
        public int CurrentPage { get; set; }
        public bool HasNext { get; set; }
    }
}