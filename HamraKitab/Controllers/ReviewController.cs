using HamraKitab.Data;
using HamraKitab.Models.DTO;
using HamraKitab.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;

namespace HamraKitab.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ReviewController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly ILogger<ReviewController> _logger;

        public ReviewController(ApplicationDbContext context, ILogger<ReviewController> logger)
        {
            _context = context;
            _logger = logger;
        }

        [HttpGet("book/{bookId}")]
        public async Task<ActionResult<IEnumerable<ReviewDto>>> GetBookReviews(Guid bookId)
        {
            var reviews = await _context.Reviews
                .Include(r => r.User)
                .Where(r => r.BookId == bookId)
                .Select(r => new ReviewDto
                {
                    ReviewId = r.ReviewId,
                    Content = r.Comment,
                    Rating = r.Rating,
                    ReviewerName = r.User.UserName
                })
                .ToListAsync();

            return Ok(reviews);
        }
        [HttpGet]
        public async Task<ActionResult<IEnumerable<AllReviewDto>>> GetReviews()
        {
            var reviews = await _context.Reviews
                .Include(r => r.User)
                    .ThenInclude(u => u.Profile)
                .Include(r => r.Book)
                .OrderByDescending(r => r.ReviewDate)
                .Select(r => new AllReviewDto
                {
                    ReviewId = r.ReviewId,
                    UserName = r.User.UserName,
                    UserId = r.User.Id,
                    BookId = r.Book.Id, // Fixed: Changed BookID to BookId
                    BookName = r.Book.Title,
                    Comment = r.Comment,
                    Rating = r.Rating,
                    ReviewDate = r.ReviewDate,
                    ProfileId = r.User.Profile != null ? r.User.Profile.ProfileId : null // Handle null Profile
                })
                .ToListAsync();

            return Ok(reviews);
        }
        [HttpGet("recommendations")]
        public async Task<ActionResult<IEnumerable<RecommendationReviewDto>>> GetReviewsforRecommendation()
        {
            // First, get users with 5 or more reviews
            var usersWithEnoughReviews = await _context.Reviews
                .GroupBy(r => r.User.Id)
                .Where(g => g.Count() >= 5)
                .Select(g => g.Key)
                .ToListAsync();

            // Then get the reviews for those users
            List<RecommendationReviewDto> reviews = await _context.Reviews
                .Include(r => r.User)
                .Include(r => r.Book)
                .Where(r => usersWithEnoughReviews.Contains(r.User.Id))
                .OrderByDescending(r => r.ReviewDate)
                .Select(r => new RecommendationReviewDto
                {
                    UserId = r.User.Id,
                    BookId = r.Book.Id,
                    Rating = r.Rating,
                })
                .ToListAsync();

            return Ok(reviews);
        }

        [Authorize]
        [HttpPost("book/{bookId}")]
        public async Task<ActionResult<ReviewDto>> CreateReview(Guid bookId, AddReviewDto reviewDto)
        {
            var book = await _context.Books.FindAsync(bookId);
            if (book == null)
            {
                return NotFound("Book not found");
            }

            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var existingReview = await _context.Reviews
                .FirstOrDefaultAsync(r => r.BookId == bookId && r.UserId == userId);

            if (existingReview != null)
            {
                return BadRequest("You have already reviewed this book");
            }

            var review = new Review
            {
                BookId = bookId,
                UserId = userId,
                Comment = reviewDto.Comment,  // Fixed: Using reviewDto parameter instead of ReviewDto type
                Rating = reviewDto.Rating     // Fixed: Using reviewDto parameter instead of ReviewDto type
            };

            _context.Reviews.Add(review);

            // Update book's average rating
            var bookReviews = await _context.Reviews
                .Where(r => r.BookId == bookId)
                .Select(r => r.Rating)
                .ToListAsync();

            bookReviews.Add(review.Rating);
            book.Rating = (decimal)bookReviews.Average(r => r); // Fixed: Explicit cast to decimal

            book.UpdatedAt = DateTime.UtcNow;

            await _context.SaveChangesAsync();

            var responseDto = new ReviewDto  // Fixed: Renamed variable to avoid naming conflict
            {
                ReviewId = review.ReviewId,
                Content = review.Comment,
                Rating = review.Rating,
                ReviewerName = User.Identity.Name
            };

            return CreatedAtAction(nameof(GetBookReviews), new { bookId = bookId }, responseDto);
        }

        [Authorize]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteReview(Guid id)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var review = await _context.Reviews
                .Include(r => r.Book)
                .FirstOrDefaultAsync(r => r.ReviewId == id);

            if (review == null)
            {
                return NotFound();
            }

            if (review.UserId != userId)
            {
                return Forbid();
            }

            _context.Reviews.Remove(review);

            // Update book's average rating
            var bookReviews = await _context.Reviews
                .Where(r => r.BookId == review.BookId && r.ReviewId != id)
                .Select(r => r.Rating)
                .ToListAsync();

            if (bookReviews.Any())
            {
                review.Book.Rating = (decimal)bookReviews.Average(r => r); // Fixed: Explicit cast to decimal
            }
            else
            {
                review.Book.Rating = null;
            }

            review.Book.UpdatedAt = DateTime.UtcNow;

            await _context.SaveChangesAsync();

            return NoContent();
        }
    }
}