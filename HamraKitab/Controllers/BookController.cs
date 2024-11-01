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
        private const int DefaultPageSize = 10;
        private const int MaxPageSize = 50;

        public BookController(ApplicationDbContext context, ILogger<BookController> logger)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
            _logger = logger ?? throw new ArgumentNullException(nameof(logger));
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<BookResponseDto>>> GetBooks()
        {
            var books = await _context.Books
                .Include(b => b.BookGenres)
                    .ThenInclude(bg => bg.Genre)
                .Include(b => b.User)
                .Include(b => b.Reviews)
                    .ThenInclude(r => r.User)
                .Select(b => new BookResponseDto
                {
                    Id = b.Id,
                    Title = b.Title,
                    Author = b.Author,
                    GenreNames = b.BookGenres.Select(bg => bg.Genre.GenreName).ToList(),
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
                .Include(b => b.BookGenres)
                    .ThenInclude(bg => bg.Genre)
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
                GenreNames = book.BookGenres.Select(bg => bg.Genre.GenreName).ToList(),
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

            // Verify all genres exist
            var genres = await _context.Genres
                .Where(g => bookRequest.Genres.Contains(g.GenreName))
                .ToListAsync();

            if (genres.Count != bookRequest.Genres.Count)
            {
                return BadRequest("One or more invalid genres specified");
            }

            var book = new Book
            {
                Title = bookRequest.Title,
                Author = bookRequest.Author,
                PublishedDate = bookRequest.PublishedDate,
                Description = bookRequest.Description,
                Price = bookRequest.Price,
                UserId = userId
            };

            // Create BookGenre relationships
            foreach (var genre in genres)
            {
                book.BookGenres.Add(new BookGenre
                {
                    Book = book,
                    GenreId = genre.GenreId
                });
            }

            _context.Books.Add(book);
            await _context.SaveChangesAsync();

            // Load the book with all related data for the response
            var createdBook = await _context.Books
                .Include(b => b.BookGenres)
                    .ThenInclude(bg => bg.Genre)
                .Include(b => b.User)
                .FirstOrDefaultAsync(b => b.Id == book.Id);

            var response = new BookResponseDto
            {
                Id = createdBook.Id,
                Title = createdBook.Title,
                Author = createdBook.Author,
                GenreNames = createdBook.BookGenres.Select(bg => bg.Genre.GenreName).ToList(),
                PublishedDate = createdBook.PublishedDate,
                Description = createdBook.Description,
                Price = createdBook.Price,
                CreatedAt = createdBook.CreatedAt,
                UpdatedAt = createdBook.UpdatedAt,
                UserName = createdBook.User.UserName
            };

            return CreatedAtAction(nameof(GetBook), new { id = book.Id }, response);
        }

        [Authorize]
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateBook(Guid id, BookUpdateDto bookUpdate)
        {
            try
            {
                var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

                var book = await _context.Books
                    .Include(b => b.BookGenres)
                    .FirstOrDefaultAsync(b => b.Id == id);

                if (book == null)
                {
                    return NotFound("Book not found");
                }

                if (book.UserId != userId)
                {
                    return Forbid();
                }

                // Verify all genres exist
                var genres = await _context.Genres
                    .Where(g => bookUpdate.GenreIds.Contains(g.GenreId))
                    .ToListAsync();

                if (genres.Count != bookUpdate.GenreIds.Count)
                {
                    ModelState.AddModelError("GenreIds", "One or more invalid genres specified");
                    return BadRequest(ModelState);
                }

                // Update basic properties
                book.Title = bookUpdate.Title;
                book.Author = bookUpdate.Author;
                book.PublishedDate = bookUpdate.PublishedDate;
                book.Description = bookUpdate.Description;
                book.Price = bookUpdate.Price;
                book.UpdatedAt = DateTime.UtcNow;

                // Update genres
                // Remove existing relationships
                _context.BookGenres.RemoveRange(book.BookGenres);

                // Add new relationships
                foreach (var genreId in bookUpdate.GenreIds)
                {
                    book.BookGenres.Add(new BookGenre
                    {
                        BookId = book.Id,
                        GenreId = genreId
                    });
                }

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
                _logger.LogError(ex, "Error occurred while updating book {BookId}", id);
                return StatusCode(500, "An error occurred while updating the book");
            }
        }

        private async Task<bool> BookExists(Guid id)
        {
            return await _context.Books.AnyAsync(b => b.Id == id);
        }

        [Authorize]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteBook(Guid id)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var book = await _context.Books
                .Include(b => b.BookGenres)
                .FirstOrDefaultAsync(b => b.Id == id);

            if (book == null)
            {
                return NotFound();
            }

            if (book.UserId != userId)
            {
                return Forbid();
            }

            _context.BookGenres.RemoveRange(book.BookGenres);
            _context.Books.Remove(book);
            await _context.SaveChangesAsync();

            return NoContent();
        }
        
    }
}