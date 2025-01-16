using HamraKitab.Models.DTO;
namespace HamraKitab.Models.DTO
{
    public class UserBookActivityStatsDto
    {
        public string UserId { get; set; }
        public string UserName { get; set; }
        public int UniqueBookCount { get; set; }
        public int TotalActivityCount { get; set; }
        public List<BookActivityDetailDto> BookActivities { get; set; }

       

    }
}
