using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using HamraKitab.Models.DTO;
using HamraKitab.Models;
using HamraKitab.Repositories;
using System.Text.RegularExpressions;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using HamraKitab.Data;

namespace HamraKitab.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly ITokenRepository _tokenRepository;
        private readonly ApplicationDbContext _context;

        public AuthController(
            UserManager<ApplicationUser> userManager,
            ITokenRepository tokenRepository,
             ApplicationDbContext context)
        {
            _userManager = userManager;
            _tokenRepository = tokenRepository;
            _context = context;
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody] RegisterRequestDto registerDto)
        {
            using var transaction = await _context.Database.BeginTransactionAsync();
            try
            {
                // Validate if user exists
                var userExists = await _userManager.FindByEmailAsync(registerDto.Email);
                if (userExists != null)
                {
                    return BadRequest("User with this email already exists");
                }

                var userNameExists = await _userManager.FindByNameAsync(registerDto.UserName);
                if (userNameExists != null)
                {
                    return BadRequest("Username is already taken");
                }

                // Create new user
                var user = new ApplicationUser
                {
                    UserName = registerDto.UserName,
                    Email = registerDto.Email,
                    CreatedAt = DateTime.UtcNow
                };

                var result = await _userManager.CreateAsync(user, registerDto.Password);
                if (!result.Succeeded)
                {
                    return BadRequest(result.Errors);
                }

                // Assign role
                string role = string.IsNullOrEmpty(registerDto.Role) ? UserRole.User.ToString() : registerDto.Role;
                await _userManager.AddToRoleAsync(user, role);

                // Add all books as initial recommendations
                var initialRecommendations = new[]
                {
                    "Words of Radiance (The Stormlight Archive, #2)",
                    "The Way of Kings (The Stormlight Archive, #1)",
                    "Harry Potter and the Deathly Hallows (Harry Potter, #7)",
                    "J.R.R. Tolkien 4-Book Boxed Set: The Hobbit and The Lord of the Rings",
                    "The Name of the Wind (The Kingkiller Chronicle, #1)",
                    "Harry Potter and the Half-Blood Prince (Harry Potter, #6)",
                    "A Storm of Swords (A Song of Ice and Fire, #3)",
                    "The Nightingale",
                    "Harry Potter and the Prisoner of Azkaban (Harry Potter, #3)",
                    "Harry Potter and the Goblet of Fire (Harry Potter, #4)",
                    "The Return of the King (The Lord of the Rings, #3)",
                    "The Complete Sherlock Holmes",
                    "Blood Song (Raven's Shadow, #1)",
                    "Harry Potter and the Order of the Phoenix (Harry Potter, #5)",
                    "The Hero of Ages (Mistborn, #3)",
                    "The Help",
                    "A Game of Thrones (A Song of Ice and Fire, #1)",
                    "Harry Potter and the Sorcerer's Stone",
                    "The Essential Rumi",
                    "A Breath of Snow and Ashes (Outlander, #6)",
                    "The Final Empire (Mistborn, #1)"
                };

                // Get all books
                var recommendedBooks = await _context.Books
                    .Where(b => initialRecommendations.Contains(b.Title))
                    .ToListAsync();

                // Create recommendations for all books
                var recommendations = recommendedBooks.Select(book => new Recommendation
                {
                    UserId = user.Id,
                    BookId = book.Id
                }).ToList();

                // Add recommendations to database
                await _context.Recommendations.AddRangeAsync(recommendations);
                await _context.SaveChangesAsync();

                await transaction.CommitAsync();
                return Ok($"User registered successfully with {recommendations.Count} book recommendations");
            }
            catch (Exception ex)
            {
                await transaction.RollbackAsync();
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginRequestDto loginDto)
        {
            try
            {
                // Find user by email or username
                var user = await _userManager.FindByEmailAsync(loginDto.UserIdentifier)
                    ?? await _userManager.FindByNameAsync(loginDto.UserIdentifier);

                if (user == null)
                {
                    return BadRequest("Invalid credentials");
                }

                // Verify password
                var isPasswordValid = await _userManager.CheckPasswordAsync(user, loginDto.Password);
                if (!isPasswordValid)
                {
                    return BadRequest("Invalid credentials");
                }

                // Check and populate recommendations
                await EnsureUserRecommendations(user.Id);

                // Get user role
                var roles = await _userManager.GetRolesAsync(user);
                var role = roles.FirstOrDefault() ?? UserRole.User.ToString();

                // Generate JWT token
                var token = _tokenRepository.CreateJWTToken(user, role);
                var response = new LoginResponseDto
                {
                    JwtToken = token,
                    Role = role,
                    UserId = user.Id
                };

                return Ok(response);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        private async Task EnsureUserRecommendations(string userId)
        {
            try
            {
                // Check if user has any recommendations
                var hasRecommendations = await _context.Recommendations
                    .AnyAsync(r => r.UserId == userId);

                if (!hasRecommendations)
                {
                    Console.WriteLine($"No recommendations found for user {userId}. Initializing recommendation table...");

                    // List of book titles to find in the database
                    var bookTitles = new List<string>
                    {
                        "Words of Radiance (The Stormlight Archive, #2)",
                        "The Way of Kings (The Stormlight Archive, #1)",
                        "Harry Potter and the Deathly Hallows (Harry Potter, #7)",
                        "J.R.R. Tolkien 4-Book Boxed Set: The Hobbit and The Lord of the Rings",
                        "The Name of the Wind (The Kingkiller Chronicle, #1)",
                        "Harry Potter and the Half-Blood Prince (Harry Potter, #6)",
                        "A Storm of Swords (A Song of Ice and Fire, #3)",
                        "The Nightingale",
                        "Harry Potter and the Prisoner of Azkaban (Harry Potter, #3)",
                        "Harry Potter and the Goblet of Fire (Harry Potter, #4)",
                        "The Return of the King (The Lord of the Rings, #3)",
                        "The Complete Sherlock Holmes",
                        "Blood Song (Raven's Shadow, #1)",
                        "Harry Potter and the Order of the Phoenix (Harry Potter, #5)",
                        "The Hero of Ages (Mistborn, #3)",
                        "The Help",
                        "A Game of Thrones (A Song of Ice and Fire, #1)",
                        "Harry Potter and the Sorcerer's Stone",
                        "The Essential Rumi",
                        "A Breath of Snow and Ashes (Outlander, #6)",
                        "The Final Empire (Mistborn, #1)"
                    };

                    // Get corresponding BookIds from the Book table
                    var books = await _context.Books
                        .Where(b => bookTitles.Contains(b.Title))
                        .ToListAsync();

                    // Create recommendation entries
                    var recommendations = books.Select(book => new Recommendation
                    {
                        UserId = userId,
                        BookId = book.Id
                    }).ToList();

                    // Add recommendations to database
                    await _context.Recommendations.AddRangeAsync(recommendations);
                    await _context.SaveChangesAsync();

                    Console.WriteLine($"Successfully added {recommendations.Count} recommendations for user {userId}");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error ensuring recommendations for user {userId}: {ex.Message}");
                throw; // Re-throw the exception to be handled by the calling method
            }
        }
    }
}