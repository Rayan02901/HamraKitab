using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using HamraKitab.Data;
using HamraKitab.Models;
using HamraKitab.Models.DTO;
using System.Security.Claims;
using Microsoft.AspNetCore.Identity;

using ActivityDto = HamraKitab.Models.DTO.ActivityDto;

namespace HamraKitab.Controllers
{
    [Authorize]
    [ApiController]
    [Route("api/[controller]")]
    public class UserProfileController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly IWebHostEnvironment _environment;
        private readonly ILogger<UserProfileController> _logger;

        public UserProfileController(
            ApplicationDbContext context,
            UserManager<ApplicationUser> userManager,
            IWebHostEnvironment environment,
            ILogger<UserProfileController> logger)
        {
            _context = context;
            _userManager = userManager;
            _environment = environment;
            _logger = logger;
        }

        // GET: api/userprofile
        [HttpGet]
        public async Task<ActionResult<UserProfileResponseDto>> GetUserProfile()
        {
            var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (string.IsNullOrEmpty(userId))
                return Unauthorized();

            var profile = await _context.UserProfiles
                .Include(p => p.UserProfilePhotos)
                .Include(p => p.Activities)
                    .ThenInclude(a => a.Book)
                .Include(p => p.Friends)
                    .ThenInclude(f => f.FriendUser)
                .FirstOrDefaultAsync(p => p.UserId == userId);

            if (profile == null)
                return NotFound();

            return Ok(MapToResponseDto(profile));
        }

        // GET: api/userprofile/{profileId}
        [HttpGet("{profileId}")]
        public async Task<ActionResult<UserProfileResponseDto>> GetUserProfileById(Guid profileId)
        {
            var profile = await _context.UserProfiles
                .Include(p => p.UserProfilePhotos)
                .Include(p => p.Activities)
                    .ThenInclude(a => a.Book)
                .Include(p => p.Friends)
                    .ThenInclude(f => f.FriendUser)
                .FirstOrDefaultAsync(p => p.ProfileId == profileId);

            if (profile == null)
                return NotFound();

            return Ok(MapToResponseDto(profile));
        }

        // POST: api/userprofile
        [HttpPost]
        public async Task<ActionResult<UserProfileResponseDto>> CreateUserProfile([FromForm] UserProfileRequestDto request)
        {
            var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (string.IsNullOrEmpty(userId))
                return Unauthorized();

            var existingProfile = await _context.UserProfiles
                .FirstOrDefaultAsync(p => p.UserId == userId);

            if (existingProfile != null)
                return BadRequest("Profile already exists");

            var profile = new UserProfile
            {
                UserId = userId,
                FullName = request.FullName,
                Bio = request.Bio,
                CreatedAt = DateTime.UtcNow
            };

            _context.UserProfiles.Add(profile);
            await _context.SaveChangesAsync();

            if (request.Photo != null)
            {
                var photoResult = await SaveProfilePhoto(profile.ProfileId, request.Photo, true);
                if (photoResult.Error != null)
                    return BadRequest(photoResult.Error);
            }

            return CreatedAtAction(nameof(GetUserProfile), MapToResponseDto(profile));
        }

        // PUT: api/userprofile
        [HttpPut]
        public async Task<IActionResult> UpdateUserProfile([FromBody] UserProfileUpdateDto request)
        {
            var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (string.IsNullOrEmpty(userId))
                return Unauthorized();

            var profile = await _context.UserProfiles
                .FirstOrDefaultAsync(p => p.UserId == userId);

            if (profile == null)
                return NotFound();

            profile.FullName = request.FullName;
            profile.Bio = request.Bio;
            profile.UpdatedAt = DateTime.UtcNow;

            try
            {
                await _context.SaveChangesAsync();
                return NoContent();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UserProfileExists(profile.ProfileId))
                    return NotFound();
                throw;
            }
        }

        // POST: api/userprofile/photos
        [HttpPost("photos")]
        public async Task<ActionResult<List<UserProfilePhoto>>> UploadPhotos([FromForm] UserProfilePhotoUpload request)
        {
            var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (string.IsNullOrEmpty(userId))
                return Unauthorized();

            var profile = await _context.UserProfiles
                .Include(p => p.UserProfilePhotos)
                .FirstOrDefaultAsync(p => p.UserId == userId);

            if (profile == null)
                return NotFound();

            var uploadedPhotos = new List<UserProfilePhoto>();

            foreach (var photo in request.Photos)
            {
                var photoResult = await SaveProfilePhoto(profile.ProfileId, photo, !profile.UserProfilePhotos.Any());
                if (photoResult.Error == null && photoResult.Photo != null)
                {
                    uploadedPhotos.Add(photoResult.Photo);
                }
            }

            return Ok(uploadedPhotos);
        }

        // PUT: api/userprofile/photos/{photoId}/main
        [HttpPut("photos/{photoId}/main")]
        public async Task<IActionResult> SetMainPhoto(Guid photoId)
        {
            var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (string.IsNullOrEmpty(userId))
                return Unauthorized();

            var profile = await _context.UserProfiles
                .Include(p => p.UserProfilePhotos)
                .FirstOrDefaultAsync(p => p.UserId == userId);

            if (profile == null)
                return NotFound();

            var photo = profile.UserProfilePhotos.FirstOrDefault(p => p.PhotoId == photoId);
            if (photo == null)
                return NotFound();

            var currentMain = profile.UserProfilePhotos.FirstOrDefault(p => p.IsMainPhoto);
            if (currentMain != null)
            {
                currentMain.IsMainPhoto = false;
            }

            photo.IsMainPhoto = true;
            await _context.SaveChangesAsync();

            return NoContent();
        }

        // DELETE: api/userprofile/photos/{photoId}
        [HttpDelete("photos/{photoId}")]
        public async Task<IActionResult> DeletePhoto(Guid photoId)
        {
            var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (string.IsNullOrEmpty(userId))
                return Unauthorized();

            var photo = await _context.UserProfilePhotos
                .Include(p => p.UserProfile)
                .FirstOrDefaultAsync(p => p.PhotoId == photoId && p.UserProfile.UserId == userId);

            if (photo == null)
                return NotFound();

            if (photo.IsMainPhoto)
                return BadRequest("Cannot delete main photo");

            var filePath = Path.Combine(_environment.WebRootPath, "uploads", photo.PhotoUrl);
            if (System.IO.File.Exists(filePath))
            {
                System.IO.File.Delete(filePath);
            }

            _context.UserProfilePhotos.Remove(photo);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool UserProfileExists(Guid profileId)
        {
            return _context.UserProfiles.Any(e => e.ProfileId == profileId);
        }

        private async Task<(UserProfilePhoto? Photo, string? Error)> SaveProfilePhoto(Guid profileId, IFormFile file, bool isMain)
        {
            try
            {
                var uploadDir = Path.Combine(_environment.WebRootPath, "uploads");
                if (!Directory.Exists(uploadDir))
                    Directory.CreateDirectory(uploadDir);

                var fileName = $"{Guid.NewGuid()}{Path.GetExtension(file.FileName)}";
                var filePath = Path.Combine(uploadDir, fileName);

                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    await file.CopyToAsync(fileStream);
                }

                var photo = new UserProfilePhoto
                {
                    ProfileId = profileId,
                    PhotoUrl = fileName,
                    IsMainPhoto = isMain,
                    UploadedAt = DateTime.UtcNow
                };

                _context.UserProfilePhotos.Add(photo);
                await _context.SaveChangesAsync();

                return (photo, null);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error saving profile photo");
                return (null, "Error saving profile photo");
            }
        }

        private static UserProfileResponseDto MapToResponseDto(UserProfile profile)
        {
            return new UserProfileResponseDto
            {
                ProfileId = profile.ProfileId,
                FullName = profile.FullName,
                Bio = profile.Bio ?? string.Empty,
                UserProfilePhotos = profile.UserProfilePhotos.ToList(),
                CreatedAt = profile.CreatedAt,
                Activities = profile.Activities
                    .Select(a => new ActivityDto
                    {
                        ActivityId = a.ActivityId,
                        UserId = a.UserId,
                        BookId = a.BookId,
                        ActionId = a.ActionId,
                        CreatedAt = a.CreatedAt,
                        Book = new BookDto // Assuming you have a BookDto class
                        {
                            Id = a.Book.Id,
                            Title = a.Book.Title,
                            // Add other relevant book properties
                        },
                        Action = new ActionDto // Assuming you have an ActionDto class
                        {
                            ActionId = a.Action.ActionId,
                            Name = a.Action.Name
                        }
                    })
                    .ToList(),
                Friends = profile.Friends
                    .Select(f => new FriendDto
                    {
                        FriendId = f.FriendId,
                        UserId = f.UserId,
                        FriendUserId = f.FriendUserId,
                        CreatedAt = f.CreatedAt,
                        FriendUser = new UserDto // Assuming you have a UserDto class
                        {
                            Id = f.FriendUser.Id,
                            UserName = f.FriendUser.UserName,
                            // Add other relevant user properties that you want to expose
                            Profile = f.FriendUser.Profile != null ? new UserProfileDto
                            {
                                FullName = f.FriendUser.Profile.FullName,
                                ProfilePhoto = f.FriendUser.Profile.UserProfilePhotos
            .FirstOrDefault(p => p.IsMainPhoto)?.PhotoUrl
                            } : null
                        }
                    })
                    .ToList()
            };
        }
    }
}