namespace HamraKitab.Models.DTO
{
    public class UserBookIdsDto
    {
        public string UserId { get; set; }
        public List<Guid> BookIds { get; set; }
    }
}
