namespace HamraKitab.Models.DTO
{
    public class UserDto
    {
        public string Id { get; set; }
        public string UserName { get; set; }
        public UserProfileDto Profile { get; set; }
    }
}
