using AutoMapper;
using HamraKitab.Data;
using HamraKitab.Models;
using HamraKitab.Models.DTO;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace HamraKitab.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class BookController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly ILogger<BookController> _logger;

        public BookController(ApplicationDbContext context, ILogger<BookController> logger)
        {
            _context = context;
            _logger = logger;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<BookResponseDto>>> GetBooks()
        {
            var books = await _context.Books
                .Include(b => b.Genre)
                .Include(b => b.User)
                .Include(b => b.Reviews)
                    .ThenInclude(r => r.User)
                .Select(b => new BookResponseDto
                {
                    Id = b.Id,
                    Title = b.Title,
                    Author = b.Author,
                    GenreName = b.Genre.GenreName,
                    PublishedDate = b.PublishedDate,
                    Description = b.Description,
                    Rating = b.Rating,
                    Price = b.Price,
                    CreatedAt = b.CreatedAt,
                    UpdatedAt = b.UpdatedAt,
                    UserName = b.User.UserName,
                    Reviews = b.Reviews.Select(r => new ReviewDto
                    {
                        ReviewId = r.ReviewId,
                        Content = r.Comment,
                        Rating = r.Rating,
                        ReviewerName = r.User.UserName
                    }).ToList()
                })
                .ToListAsync();

            return Ok(books);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<BookResponseDto>> GetBook(Guid id)
        {
            var book = await _context.Books
                .Include(b => b.Genre)
                .Include(b => b.User)
                .Include(b => b.Reviews)
                    .ThenInclude(r => r.User)
                .FirstOrDefaultAsync(b => b.Id == id);

            if (book == null)
            {
                return NotFound();
            }

            var bookResponse = new BookResponseDto
            {
                Id = book.Id,
                Title = book.Title,
                Author = book.Author,
                GenreName = book.Genre.GenreName,
                PublishedDate = book.PublishedDate,
                Description = book.Description,
                Rating = book.Rating,
                Price = book.Price,
                CreatedAt = book.CreatedAt,
                UpdatedAt = book.UpdatedAt,
                UserName = book.User.UserName,
                Reviews = book.Reviews.Select(r => new ReviewDto
                {
                    ReviewId = r.ReviewId,
                    Content = r.Comment,
                    Rating = r.Rating,
                    ReviewerName = r.User.UserName
                }).ToList()
            };

            return Ok(bookResponse);
        }

        [Authorize]
        [HttpPost]
        public async Task<ActionResult<BookResponseDto>> CreateBook([FromBody] BookRequestDto bookRequest)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var genre = await _context.Genres.FirstOrDefaultAsync(g => g.GenreName == bookRequest.Genre);

            if (genre == null)
            {
                return BadRequest("Invalid genre specified");
            }

            var book = new Book
            {
                Title = bookRequest.Title,
                Author = bookRequest.Author,
                GenreId = genre.GenreId,
                PublishedDate = bookRequest.PublishedDate,
                Description = bookRequest.Description,
                Price = bookRequest.Price,
                UserId = userId
            };

            _context.Books.Add(book);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetBook), new { id = book.Id }, book);
        }

        [Authorize]
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateBook(Guid id, BookUpdateDto bookUpdate)
        {
            try
            {
                // Get the current user's ID
                var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

                // Find the book and include Genre for validation
                var book = await _context.Books
                    .Include(b => b.Genre)
                    .FirstOrDefaultAsync(b => b.Id == id);

                if (book == null)
                {
                    return NotFound("Book not found");
                }

                // Check if user owns the book
                if (book.UserId != userId)
                {
                    return Forbid();
                }

                // Validate if the genre exists
                var genreExists = await _context.Genres.AnyAsync(g => g.GenreId == bookUpdate.GenreId);
                if (!genreExists)
                {
                    ModelState.AddModelError("GenreId", "Invalid genre selected");
                    return BadRequest(ModelState);
                }

                // Update the book properties
                book.Title = bookUpdate.Title;
                book.Author = bookUpdate.Author;
                book.GenreId = bookUpdate.GenreId;
                book.PublishedDate = bookUpdate.PublishedDate;
                book.Description = bookUpdate.Description;
                book.Price = bookUpdate.Price;
                book.UpdatedAt = DateTime.UtcNow;

                await _context.SaveChangesAsync();
                return NoContent();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!await BookExists(id))
                {
                    return NotFound();
                }
                throw;
            }
            catch (Exception ex)
            {
                // Log the exception
                return StatusCode(500, "An error occurred while updating the book");
            }
        }

        // Helper method to check if book exists
        private async Task<bool> BookExists(Guid id)
        {
            return await _context.Books.AnyAsync(b => b.Id == id);
        }

        [Authorize]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteBook(Guid id)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var book = await _context.Books.FindAsync(id);

            if (book == null)
            {
                return NotFound();
            }

            if (book.UserId != userId)
            {
                return Forbid();
            }

            _context.Books.Remove(book);
            await _context.SaveChangesAsync();

            return NoContent();
        }
    }
}
