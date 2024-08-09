using Microsoft.AspNetCore.Mvc;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;
using HamraKitab.Models;
using HamraKitab.Data;

namespace HamraKitab.Server.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class BooksController : ControllerBase
    {
        private readonly IMongoCollection<Book> _booksCollection;
        private readonly ILogger<BooksController> _logger;

        public BooksController(MongoDbContext dbContext, ILogger<BooksController> logger)
        {
            _booksCollection = dbContext.Books;
            _logger = logger;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Book>>> GetBooks()
        {
            try
            {
                var books = await _booksCollection.Find(_ => true).ToListAsync();
                return Ok(books);
                // return StatusCode(200, "Success");
            }
            catch (Exception ex)
            {
                _logger.LogError($"Error retrieving books: {ex.Message}");
                return StatusCode(500, "Internal server error");
            }
        }

        [HttpGet("{id:int}")]
        public async Task<ActionResult<Book>> GetBookById(int id)
        {
            try
            {
                var book = await _booksCollection.Find(b => b.Id == id).FirstOrDefaultAsync();
                if (book == null)
                {
                    return NotFound($"Book with ID {id} not found.");
                }
                return Ok(book);
            }
            catch (Exception ex)
            {
                _logger.LogError($"Error retrieving book with ID {id}: {ex.Message}");
                return StatusCode(500, "Internal server error");
            }
        }

        [HttpPost]
        public async Task<ActionResult<Book>> CreateBook(Book book)
        {
            try
            {
                if (book == null)
                {
                    return BadRequest("Book data is null.");
                }

                // Assuming Id is auto-incremented
                var maxIdBook = await _booksCollection.Find(_ => true)
                                                      .SortByDescending(b => b.Id)
                                                      .FirstOrDefaultAsync();
                book.Id = (maxIdBook?.Id ?? 0) + 1;

                await _booksCollection.InsertOneAsync(book);
                return CreatedAtAction(nameof(GetBookById), new { id = book.Id }, book);
            }
            catch (Exception ex)
            {
                _logger.LogError($"Error creating book: {ex.Message}");
                return StatusCode(500, "Internal server error");
            }
        }

        [HttpPut("{id:int}")]
        public async Task<IActionResult> UpdateBook(int id, Book bookUpdate)
        {
            try
            {
                if (bookUpdate == null)
                {
                    return BadRequest("Updated book data is null.");
                }

                bookUpdate.Id = id; // Ensure the ID matches the route
                var result = await _booksCollection.ReplaceOneAsync(b => b.Id == id, bookUpdate);

                if (result.MatchedCount == 0)
                {
                    return NotFound($"Book with ID {id} not found.");
                }

                return NoContent();
            }
            catch (Exception ex)
            {
                _logger.LogError($"Error updating book with ID {id}: {ex.Message}");
                return StatusCode(500, "Internal server error");
            }
        }

        [HttpDelete("{id:int}")]
        public async Task<IActionResult> DeleteBook(int id)
        {
            try
            {
                var result = await _booksCollection.DeleteOneAsync(book => book.Id == id);
                if (result.DeletedCount == 0)
                {
                    return NotFound($"Book with ID {id} not found.");
                }

                return NoContent();
            }
            catch (Exception ex)
            {
                _logger.LogError($"Error deleting book with ID {id}: {ex.Message}");
                return StatusCode(500, "Internal server error");
            }
        }
    }
}