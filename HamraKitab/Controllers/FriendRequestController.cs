using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using HamraKitab.Models;
using HamraKitab.Data;
using HamraKitab.DTOs;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using System.Security.Claims;

namespace HamraKitab.Controllers
{
    [Authorize]
    [ApiController]
    [Route("api/[controller]")]
    public class FriendRequestController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public FriendRequestController(ApplicationDbContext context)
        {
            _context = context;
        }

        // POST: api/FriendRequest
        [HttpPost]
        public async Task<ActionResult<FriendRequestDto>> SendFriendRequest(string recipientId)
        {
            var requesterId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (string.IsNullOrEmpty(requesterId))
                return Unauthorized();

            // Check if recipient exists
            var recipientExists = await _context.Users.AnyAsync(u => u.Id == recipientId);
            if (!recipientExists)
                return NotFound("Recipient not found");

            // Check if request already exists
            var existingRequest = await _context.FriendRequests
                .AnyAsync(fr => fr.RequesterId == requesterId && fr.RecipientId == recipientId);

            if (existingRequest)
                return BadRequest("Friend request already sent");

            // Check if they're already friends
            var alreadyFriends = await _context.Friends
                .AnyAsync(f => f.UserId == requesterId && f.FriendUserId == recipientId);

            if (alreadyFriends)
                return BadRequest("Already friends");

            var friendRequest = new FriendRequest
            {
                RequesterId = requesterId,
                RecipientId = recipientId,
                CreatedAt = DateTime.UtcNow,
                IsAccepted = false
            };

            _context.FriendRequests.Add(friendRequest);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetFriendRequest),
                new { id = friendRequest.FriendRequestId },
                new FriendRequestDto
                {
                    FriendRequestId = friendRequest.FriendRequestId,
                    RequesterId = friendRequest.RequesterId,
                    RecipientId = friendRequest.RecipientId,
                    CreatedAt = friendRequest.CreatedAt,
                    IsAccepted = friendRequest.IsAccepted
                });
        }

        // GET: api/FriendRequest
        [HttpGet]
        public async Task<ActionResult<IEnumerable<FriendRequestDto>>> GetReceivedFriendRequests()
        {
            var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (string.IsNullOrEmpty(userId))
                return Unauthorized();

            var requests = await _context.FriendRequests
                .Where(fr => fr.RecipientId == userId && !fr.IsAccepted)
                .Select(fr => new FriendRequestDto
                {
                    FriendRequestId = fr.FriendRequestId,
                    RequesterId = fr.RequesterId,
                    RecipientId = fr.RecipientId,
                    CreatedAt = fr.CreatedAt,
                    IsAccepted = fr.IsAccepted
                })
                .ToListAsync();

            return Ok(requests);
        }

        // GET: api/FriendRequest/{id}
        [HttpGet("{id}")]
        public async Task<ActionResult<FriendRequestDto>> GetFriendRequest(Guid id)
        {
            var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (string.IsNullOrEmpty(userId))
                return Unauthorized();

            var request = await _context.FriendRequests
                .FirstOrDefaultAsync(fr => fr.FriendRequestId == id &&
                    (fr.RequesterId == userId || fr.RecipientId == userId));

            if (request == null)
                return NotFound();

            return new FriendRequestDto
            {
                FriendRequestId = request.FriendRequestId,
                RequesterId = request.RequesterId,
                RecipientId = request.RecipientId,
                CreatedAt = request.CreatedAt,
                IsAccepted = request.IsAccepted
            };
        }

        // POST: api/FriendRequest/{id}/accept
        [HttpPost("{id}/accept")]
        public async Task<IActionResult> AcceptFriendRequest(Guid id)
        {
            var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (string.IsNullOrEmpty(userId))
                return Unauthorized();

            var request = await _context.FriendRequests
                .FirstOrDefaultAsync(fr => fr.FriendRequestId == id && fr.RecipientId == userId);

            if (request == null)
                return NotFound();

            if (request.IsAccepted)
                return BadRequest("Request already accepted");

            using var transaction = await _context.Database.BeginTransactionAsync();
            try
            {
                // Create reciprocal friend entries
                var friendship1 = new Friend
                {
                    UserId = request.RequesterId,
                    FriendUserId = request.RecipientId,
                    CreatedAt = DateTime.UtcNow
                };

                var friendship2 = new Friend
                {
                    UserId = request.RecipientId,
                    FriendUserId = request.RequesterId,
                    CreatedAt = DateTime.UtcNow
                };

                request.IsAccepted = true;

                _context.Friends.Add(friendship1);
                _context.Friends.Add(friendship2);
                await _context.SaveChangesAsync();
                await transaction.CommitAsync();

                return NoContent();
            }
            catch
            {
                await transaction.RollbackAsync();
                throw;
            }
        }

        // DELETE: api/FriendRequest/{id}
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteFriendRequest(Guid id)
        {
            var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (string.IsNullOrEmpty(userId))
                return Unauthorized();

            var request = await _context.FriendRequests
                .FirstOrDefaultAsync(fr => fr.FriendRequestId == id &&
                    (fr.RequesterId == userId || fr.RecipientId == userId));

            if (request == null)
                return NotFound();

            _context.FriendRequests.Remove(request);
            await _context.SaveChangesAsync();

            return NoContent();
        }
    }
}