using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using HamraKitab.Data;
using HamraKitab.Models;
using HamraKitab.Models.DTO;
using Microsoft.AspNetCore.Authorization;

namespace HamraKitab.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class GenreController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly ILogger<GenreController> _logger;

        public GenreController(ApplicationDbContext context, ILogger<GenreController> logger)
        {
            _context = context;
            _logger = logger;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Genre>>> GetGenres()
        {
            return await _context.Genres.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Genre>> GetGenre(Guid id)
        {
            var genre = await _context.Genres.FindAsync(id);

            if (genre == null)
            {
                return NotFound();
            }

            return genre;
        }

        [Authorize(Roles = "Admin")]
        [HttpPost]
        public async Task<ActionResult<Genre>> CreateGenre(AddGenreDto genreDto)
        {
            var genre = new Genre
            {
                GenreName = genreDto.GenreName
            };

            _context.Genres.Add(genre);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetGenre), new { id = genre.GenreId }, genre);
        }

        [Authorize(Roles = "Admin")]
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateGenre(Guid id, UpdateGenreDTO genreDto)
        {
            var genre = await _context.Genres.FindAsync(id);

            if (genre == null)
            {
                return NotFound();
            }

            genre.GenreName = genreDto.GenreName;
            await _context.SaveChangesAsync();

            return NoContent();
        }

        [Authorize(Roles = "Admin")]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteGenre(Guid id)
        {
            var genre = await _context.Genres.FindAsync(id);

            if (genre == null)
            {
                return NotFound();
            }

            _context.Genres.Remove(genre);
            await _context.SaveChangesAsync();

            return NoContent();
        }
    }
}
