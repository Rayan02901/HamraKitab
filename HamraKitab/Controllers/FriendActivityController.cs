using HamraKitab.Data;
using HamraKitab.Models;
using HamraKitab.Models.DTO;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace HamraKitab.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class FriendActivitiesController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private const int PageSize = 10;

        public FriendActivitiesController(ApplicationDbContext context)
        {
            _context = context;
        }

        /// <summary>
        /// Gets paginated activities of all friends for a given user
        /// </summary>
        /// <param name="userId">The ID of the user whose friends' activities to retrieve</param>
        /// <param name="page">Page number (1-based)</param>
        /// <returns>Paginated list of friend activities</returns>
        [HttpGet("user/{userId}")]
        public async Task<ActionResult<PaginatedResponse<FriendActivityDto>>> GetFriendActivities(string userId, [FromQuery] int page = 1)
        {
            if (page < 1)
                return BadRequest("Page number must be greater than 0");

            // First get all friend IDs for the user
            var friendUserIds = await _context.Friends
                .Where(f => f.UserId == userId)
                .Select(f => f.FriendUserId)
                .ToListAsync();

            // Then get activities for all friends
            var query = _context.Activities
                .Where(a => friendUserIds.Contains(a.UserId))
                .Include(a => a.User)
                    .ThenInclude(u => u.Profile)
                .Include(a => a.Action)
                .Include(a => a.Book)
                .OrderByDescending(a => a.CreatedAt)
                .Select(a => new FriendActivityDto
                {
                    ActivityId = a.ActivityId,
                    UserName = a.User.UserName,
                    UserFullName = a.User.Profile.FullName,
                    ActionName = a.Action.Name,
                    BookName = a.Book.Title,
                    ActivityDate = a.CreatedAt
                });

            // Calculate pagination values
            var totalItems = await query.CountAsync();
            var totalPages = (int)Math.Ceiling(totalItems / (double)PageSize);

            // Get the actual items for the requested page
            var items = await query
                .Skip((page - 1) * PageSize)
                .Take(PageSize)
                .ToListAsync();

            var response = new PaginatedResponse<FriendActivityDto>
            {
                Items = items,
                TotalPages = totalPages,
                CurrentPage = page,
                HasNext = page < totalPages
            };

            return Ok(response);
        }
    }
}