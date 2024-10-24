using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using HamraKitab.Data;
using HamraKitab.Models;
using HamraKitab.Models.DTO;
using HamraKitab.DTOs;
using System;
using System.Threading.Tasks;
using System.Linq;
using System.Collections.Generic;
using System.Security.Claims;

namespace HamraKitab.Controllers
{
    [Authorize]
    [ApiController]
    [Route("api/[controller]")]
    public class FriendController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public FriendController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/Friend
        [HttpGet]
        public async Task<ActionResult<IEnumerable<FriendDto>>> GetFriends()
        {
            var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (string.IsNullOrEmpty(userId))
                return Unauthorized();

            var friends = await _context.Friends
                .Include(f => f.FriendUser)
                .Where(f => f.UserId == userId)
                .Select(f => new FriendDto
                {
                    FriendId = f.FriendId,
                    UserId = f.UserId,
                    FriendUserId = f.FriendUserId,
                    CreatedAt = f.CreatedAt,
                    FriendUser = new UserDto
                    {
                        Id = f.FriendUser.Id,
                        UserName = f.FriendUser.UserName,
                        // Add other user properties as needed
                    }
                })
                .ToListAsync();

            return Ok(friends);
        }

        // DELETE: api/Friend/{friendId}
        [HttpDelete("{friendId}")]
        public async Task<IActionResult> RemoveFriend(Guid friendId)
        {
            var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (string.IsNullOrEmpty(userId))
                return Unauthorized();

            var friend = await _context.Friends
                .FirstOrDefaultAsync(f => f.FriendId == friendId && f.UserId == userId);

            if (friend == null)
                return NotFound();

            // Remove both friendship records
            var reciprocalFriend = await _context.Friends
                .FirstOrDefaultAsync(f => f.UserId == friend.FriendUserId && f.FriendUserId == userId);

            if (reciprocalFriend != null)
                _context.Friends.Remove(reciprocalFriend);

            _context.Friends.Remove(friend);
            await _context.SaveChangesAsync();

            return NoContent();
        }
    }
}