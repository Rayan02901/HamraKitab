using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using HamraKitab.Data;
using HamraKitab.Models.DTO;
using HamraKitab.Models;
using System.Threading.Tasks;

namespace HamraKitab.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RecommendationController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public RecommendationController(ApplicationDbContext context)
        {
            _context = context;
        }

        
        

        [HttpGet("user/{userId}")]
        public async Task<IActionResult> GetUserRecommendations(string userId)
        {
            try
            {
                // Check if user exists
                var userExists = await _context.Users.AnyAsync(u => u.Id == userId);
                if (!userExists)
                {
                    return NotFound($"User with ID {userId} not found");
                }

                // Get recommendations with book details
                var recommendations = await _context.Recommendations
                    .Where(r => r.UserId == userId)
                    .Include(r => r.Book)
                    .Select(r => new RecommendedBookDto
                    {
                        BookId = r.Book.Id,
                        Title = r.Book.Title,
                        Author = r.Book.Author
                    })
                    .ToListAsync();

                if (!recommendations.Any())
                {
                    return Ok(new
                    {
                        Message = "No recommendations found for this user",
                        Recommendations = new List<RecommendedBookDto>()
                    });
                }

                return Ok(new
                {
                    Message = $"Found {recommendations.Count} recommendations",
                    Recommendations = recommendations
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Error = $"Internal server error: {ex.Message}" });
            }
        }

        // Optional: Add recommendation for a user
        [HttpPost("add")]
        public async Task<IActionResult> AddRecommendation(string userId, Guid bookId)
        {
            try
            {
                // Check if user exists
                var userExists = await _context.Users.AnyAsync(u => u.Id == userId);
                if (!userExists)
                {
                    return NotFound($"User with ID {userId} not found");
                }

                // Check if book exists
                var bookExists = await _context.Books.AnyAsync(b => b.Id == bookId);
                if (!bookExists)
                {
                    return NotFound($"Book with ID {bookId} not found");
                }

                // Check if recommendation already exists
                var existingRecommendation = await _context.Recommendations
                    .AnyAsync(r => r.UserId == userId && r.BookId == bookId);

                if (existingRecommendation)
                {
                    return BadRequest("This book is already recommended to the user");
                }

                // Create new recommendation
                var recommendation = new Recommendation
                {
                    UserId = userId,
                    BookId = bookId
                };

                await _context.Recommendations.AddAsync(recommendation);
                await _context.SaveChangesAsync();

                return Ok("Recommendation added successfully");
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Error = $"Internal server error: {ex.Message}" });
            }
        }

        [HttpDelete("all/{userId}")]
        public async Task<IActionResult> RemoveAllRecommendations(string userId)
        {
            try
            {
                var recommendations = await _context.Recommendations
                    .Where(r => r.UserId == userId)
                    .ToListAsync();

                if (!recommendations.Any())
                {
                    return NotFound("No recommendations found for this user");
                }

                _context.Recommendations.RemoveRange(recommendations);
                var deletedCount = await _context.SaveChangesAsync();

                return Ok(new
                {
                    Message = "Recommendations removed successfully",
                    Count = deletedCount
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Error = $"Internal server error: {ex.Message}" });
            }
        }
        [HttpGet("books-with-genres")]
        public async Task<ActionResult<IEnumerable<BookGenreDto>>> GetBooksWithGenres()
        {
            try
            {
                var booksWithGenres = await _context.Books
                    .Include(b => b.BookGenres)
                    .ThenInclude(bg => bg.Genre)
                    .Select(book => new BookGenreDto
                    {
                        BookId = book.Id,
                        Title = book.Title,
                        Genres = book.BookGenres
                            .Select(bg => bg.Genre.GenreName)
                            .ToList()
                    })
                    .ToListAsync();

                if (!booksWithGenres.Any())
                {
                    return NotFound("No books found");
                }

                return Ok(booksWithGenres);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "An error occurred while retrieving books: " + ex.Message);
            }
        }
    }
}