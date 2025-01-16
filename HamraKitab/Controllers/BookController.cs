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
        // GET: api/Books/list
        [HttpGet("list")]
        public async Task<ActionResult<IEnumerable<BookListDto>>> GetBooksList()
        {
            var books = await _context.Books
                .Select(b => new BookListDto
                {
                    Id = b.Id,
                    Title = b.Title
                })
                .ToListAsync();

            return Ok(books);
        }
        /// <summary>
        /// Gets all books for a specific genre
        /// </summary>
        /// <param name="genreId">The ID of the genre to filter by</param>
        /// <returns>List of books with basic information</returns>
        [HttpGet("byGenre/{genreId}")]
        public async Task<ActionResult<IEnumerable<BookByGenreDto>>> GetBooksByGenre(Guid genreId)
        {
            var books = await _context.Books
                .Include(b => b.BookGenres)
                .Where(b => b.BookGenres.Any(bg => bg.GenreId == genreId))
                .Select(b => new BookByGenreDto
                {
                    BookId = b.Id,
                    Title = b.Title,
                    Author = b.Author
                })
                .ToListAsync();

            if (!books.Any())
            {
                return NotFound($"No books found for genre with ID: {genreId}");
            }

            return Ok(books);
        }
        [HttpGet("wanttoread")]
        [Authorize]
        public async Task<ActionResult<IEnumerable<BookByActivityDto>>> GetWantToReadBooks()
        {
            try
            {
                var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
                if (string.IsNullOrEmpty(userId))
                    return Unauthorized();

                var wantToReadActionId = Guid.Parse("8c8f1ed5-1dbd-400f-9f99-2a1e7a38db8b");

                var books = await _context.Activities
                    .Where(a => a.UserId == userId && a.ActionId == wantToReadActionId)
                    .Include(a => a.Book)
                    .Select(a => new BookByActivityDto
                    {
                        BookId = a.Book.Id,
                        Title = a.Book.Title,
                        Author = a.Book.Author
                    })
                    .ToListAsync();

                return Ok(books);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error retrieving want to read books for user");
                return StatusCode(500, "An error occurred while retrieving the books");
            }
        }

        [HttpGet("read")]
        [Authorize]
        public async Task<ActionResult<IEnumerable<BookByActivityDto>>> GetReadBooks()
        {
            try
            {
                var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
                if (string.IsNullOrEmpty(userId))
                    return Unauthorized();

                var readActionId = Guid.Parse("b11ac0d4-ff79-4024-bcd5-32bf2e6d252d");
                var startedActionId = Guid.Parse("e2ccf236-783f-42bc-bbb5-f72dd850d614");

                // First get all read books
                var readBooks = await _context.Activities
                    .Where(a => a.UserId == userId && a.ActionId == readActionId)
                    .Select(a => new
                    {
                        BookId = a.BookId,
                        CompletedAt = a.CreatedAt,
                        Book = a.Book
                    })
                    .ToListAsync();

                // Then get their start dates if they exist
                var startDates = await _context.Activities
                    .Where(a => a.UserId == userId &&
                               a.ActionId == startedActionId &&
                               readBooks.Select(rb => rb.BookId).Contains(a.BookId))
                    .Select(a => new
                    {
                        BookId = a.BookId,
                        StartedAt = a.CreatedAt
                    })
                    .ToDictionaryAsync(x => x.BookId, x => x.StartedAt);

                // Combine the data
                var result = readBooks.Select(rb => new BookByActivityDto
                {
                    BookId = rb.BookId,
                    Title = rb.Book.Title,
                    Author = rb.Book.Author,
                    StartedAt = startDates.ContainsKey(rb.BookId) ? startDates[rb.BookId] : null,
                    CompletedAt = rb.CompletedAt
                }).ToList();

                return Ok(result);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error retrieving read books for user");
                return StatusCode(500, "An error occurred while retrieving the books");
            }
        }
        [HttpGet("started")]
        [Authorize]
        public async Task<ActionResult<IEnumerable<BookByActivityDto>>> GetStartedBooks()
        {
            try
            {
                var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
                if (string.IsNullOrEmpty(userId))
                    return Unauthorized();

                var startedActionId = Guid.Parse("e2ccf236-783f-42bc-bbb5-f72dd850d614");

                var books = await _context.Activities
                    .Where(a => a.UserId == userId && a.ActionId == startedActionId)
                    .Include(a => a.Book)
                    .Select(a => new BookByActivityDto
                    {
                        BookId = a.Book.Id,
                        Title = a.Book.Title,
                        Author = a.Book.Author
                    })
                    .ToListAsync();

                return Ok(books);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error retrieving started books for user");
                return StatusCode(500, "An error occurred while retrieving the books");
            }
        }

    }
}