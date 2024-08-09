using HamraKitab.Services;
using Microsoft.AspNetCore.Mvc;



namespace HamraKitab.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class MongoController : ControllerBase
    {
        private readonly MongoDBService _mongoDBService;

        public MongoController(MongoDBService mongoDBService)
        {
            _mongoDBService = mongoDBService;
        }

        [HttpGet("ping")]
        public IActionResult Ping()
        {
            _mongoDBService.PingDatabase();
            return Ok("Pinged your deployment. You successfully connected to MongoDB!");
        }
    }
}
