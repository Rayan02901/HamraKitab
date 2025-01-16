using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using HamraKitab.Models;
using HamraKitab.Data;
using HamraKitab.Models.DTO;

namespace HamraKitab.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ActivityController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public ActivityController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/Activity/{id}
        [HttpGet("{id}")]
        public async Task<ActionResult<ActivityResponseDto>> GetActivity(Guid id)
        {
            if (id == Guid.Empty)
            {
                return BadRequest(new { Message = "Invalid activity ID." });
            }

            var activity = await GetActivityWithIncludes()
                .FirstOrDefaultAsync(a => a.ActivityId == id);

            if (activity == null)
            {
                return NotFound(new { Message = "Activity not found." });
            }

            return Ok(MapToResponseDto(activity));
        }

        // POST: api/Activity
        [HttpPost]
        public async Task<ActionResult<ActivityResponseDto>> AddActivity([FromBody] ActivityCreateDto activityDto)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            // Validate referenced entities exist
            var userExists = await _context.Users.AnyAsync(u => u.Id == activityDto.UserId);
            var bookExists = await _context.Books.AnyAsync(b => b.Id == activityDto.BookId);
            var actionExists = await _context.Actions.AnyAsync(a => a.ActionId == activityDto.ActionId);

            if (!userExists || !bookExists || !actionExists)
            {
                var errors = new List<string>();
                if (!userExists) errors.Add("User not found");
                if (!bookExists) errors.Add("Book not found");
                if (!actionExists) errors.Add("Action not found");
                return BadRequest(new { Errors = errors });
            }

            var activity = new Activity
            {
                UserId = activityDto.UserId,
                BookId = activityDto.BookId,
                ActionId = activityDto.ActionId,
                CreatedAt = DateTime.UtcNow
            };

            try
            {
                _context.Activities.Add(activity);
                await _context.SaveChangesAsync();

                var createdActivity = await GetActivityWithIncludes()
                    .FirstOrDefaultAsync(a => a.ActivityId == activity.ActivityId);

                var responseDto = MapToResponseDto(createdActivity);

                // Now this will work because GetActivity exists
                return CreatedAtAction(
                    nameof(GetActivity),
                    new { id = activity.ActivityId },
                    responseDto);
            }
            catch (DbUpdateException ex)
            {
                // Log the exception details here
                return StatusCode(500, new { Message = "An error occurred while saving the activity.", Error = ex.InnerException?.Message });
            }
        }

        // GET: api/Activity/user/{userId}
        [HttpGet("user/{userId}")]
        public async Task<ActionResult<IEnumerable<ActivityResponseDto>>> GetUserActivities(
            string userId,
            [FromQuery] int page = 1,
            [FromQuery] int pageSize = 10)
        {
            if (string.IsNullOrEmpty(userId))
            {
                return BadRequest(new { Message = "Invalid user ID." });
            }

            var query = GetActivityWithIncludes()
                .Where(a => a.UserId == userId)
                .OrderByDescending(a => a.CreatedAt);

            var totalCount = await query.CountAsync();
            var activities = await query
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();

            if (!activities.Any())
            {
                return NotFound(new { Message = "No activities found for this user." });
            }

            var response = new
            {
                TotalCount = totalCount,
                PageCount = (int)Math.Ceiling(totalCount / (double)pageSize),
                CurrentPage = page,
                PageSize = pageSize,
                Activities = activities.Select(MapToResponseDto)
            };

            return Ok(response);
        }

        // Helper method to get activities with includes
        private IQueryable<Activity> GetActivityWithIncludes()
        {
            return _context.Activities
                .Include(a => a.User)
                .Include(a => a.Book)
                .Include(a => a.Action)
                .AsNoTracking();
        }

        // Helper method to map Activity to ActivityResponseDto
        private static ActivityResponseDto MapToResponseDto(Activity activity)
        {
            if (activity == null)
                throw new ArgumentNullException(nameof(activity));

            return new ActivityResponseDto
            {
                ActivityId = activity.ActivityId,
                UserId = activity.UserId,
                UserName = activity.User?.UserName,
                BookId = activity.BookId,
                BookTitle = activity.Book?.Title,
                ActionId = activity.ActionId,
                ActionName = activity.Action?.Name,
                CreatedAt = activity.CreatedAt
            };
        }
        [HttpGet("user-book-activities")]
        public async Task<ActionResult<IEnumerable<UserBookIdsDto>>> GetUserBookActivities(
    [FromQuery] int minBookCount = 5)
        {
            try
            {
                // Get users who have activities with at least minBookCount unique books
                var userBookActivities = await _context.Activities
                    .GroupBy(a => a.UserId)
                    .Select(g => new
                    {
                        UserId = g.Key,
                        UniqueBookCount = g.Select(a => a.BookId).Distinct().Count(),
                        BookIds = g.Select(a => a.BookId).Distinct()
                    })
                    .Where(u => u.UniqueBookCount >= minBookCount)
                    .ToListAsync();  // Execute the query here

                // Then transform the results in memory
                var result = userBookActivities.Select(u => new UserBookIdsDto
                {
                    UserId = u.UserId,
                    BookIds = u.BookIds.ToList()
                }).ToList();

                if (!result.Any())
                {
                    return NotFound(new { Message = $"No users found with activities on {minBookCount} or more unique books." });
                }

                return Ok(result);
            }
            catch (Exception ex)
            {
                // Log the exception details here
                return StatusCode(500, new { Message = "An error occurred while retrieving user book activities.", Error = ex.Message });
            }
        }

        




    }
}