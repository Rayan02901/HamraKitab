using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using HamraKitab.Models.DTO;
using HamraKitab.Models;
using HamraKitab.Repositories;
using System.Text.RegularExpressions;
using System.Linq;
using System.Threading.Tasks;

namespace HamraKitab.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly ITokenRepository _tokenRepository;

        public AuthController(
            UserManager<ApplicationUser> userManager,
            ITokenRepository tokenRepository)
        {
            _userManager = userManager;
            _tokenRepository = tokenRepository;
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody] RegisterRequestDto registerDto)
        {
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

                return Ok("User registered successfully");
            }
            catch (Exception ex)
            {
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

                // Get user role
                var roles = await _userManager.GetRolesAsync(user);
                var role = roles.FirstOrDefault() ?? UserRole.User.ToString();

                // Generate JWT token
                var token = _tokenRepository.CreateJWTToken(user, role);

                var response = new LoginResponseDto
                {
                    JwtToken = token,
                    Role = role
                };

                return Ok(response);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
    }
}
