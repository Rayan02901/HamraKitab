using HamraKitab.Models;
using HamraKitab.Models.DTO;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;


namespace HamraKitab.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class UserController : ControllerBase
    {
        private readonly UserManager<ApplicationUser> _userManager;

        public UserController(UserManager<ApplicationUser> userManager)
        {
            _userManager = userManager;
        }

        [HttpGet("profile")]
        public async Task<IActionResult> GetUserProfile()
        {
            try
            {
                var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
                var user = await _userManager.FindByIdAsync(userId);

                if (user == null)
                {
                    return NotFound("User not found");
                }

                var userDto = new UserDto
                {
                    Id = user.Id,
                    UserName = user.UserName,
                    Profile = user.Profile != null ? new UserProfileDto
                    {
                        // Map profile properties here
                    } : null
                };

                return Ok(userDto);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        [HttpPut("update")]
        public async Task<IActionResult> UpdateUser([FromBody] UpdateUserDto updateDto)
        {
            try
            {
                var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
                var user = await _userManager.FindByIdAsync(userId);

                if (user == null)
                {
                    return NotFound("User not found");
                }

                // Update user properties
                if (!string.IsNullOrEmpty(updateDto.UserName) && user.UserName != updateDto.UserName)
                {
                    var userNameExists = await _userManager.FindByNameAsync(updateDto.UserName);
                    if (userNameExists != null)
                    {
                        return BadRequest("Username is already taken");
                    }
                    user.UserName = updateDto.UserName;
                }

                if (!string.IsNullOrEmpty(updateDto.Email) && user.Email != updateDto.Email)
                {
                    var emailExists = await _userManager.FindByEmailAsync(updateDto.Email);
                    if (emailExists != null)
                    {
                        return BadRequest("Email is already in use");
                    }
                    user.Email = updateDto.Email;
                }

                var result = await _userManager.UpdateAsync(user);

                if (!result.Succeeded)
                {
                    return BadRequest(result.Errors);
                }

                // Update role if provided and user is authorized (you might want to add admin check here)
                if (!string.IsNullOrEmpty(updateDto.Role))
                {
                    var currentRoles = await _userManager.GetRolesAsync(user);
                    await _userManager.RemoveFromRolesAsync(user, currentRoles);
                    await _userManager.AddToRoleAsync(user, updateDto.Role);
                }

                return Ok("User updated successfully");
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetUserById(string id)
        {
            try
            {
                var user = await _userManager.FindByIdAsync(id);

                if (user == null)
                {
                    return NotFound("User not found");
                }

                var userDto = new UserDto
                {
                    Id = user.Id,
                    UserName = user.UserName,
                    Profile = user.Profile != null ? new UserProfileDto
                    {
                        // Map profile properties here
                    } : null
                };

                return Ok(userDto);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        [HttpDelete("{id}")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> DeleteUser(string id)
        {
            try
            {
                var user = await _userManager.FindByIdAsync(id);

                if (user == null)
                {
                    return NotFound("User not found");
                }

                var result = await _userManager.DeleteAsync(user);

                if (!result.Succeeded)
                {
                    return BadRequest(result.Errors);
                }

                return Ok("User deleted successfully");
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
    }
}









