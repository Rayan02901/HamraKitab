using MongoDB.Driver;
using Microsoft.Extensions.Configuration;
using HamraKitab.Models; // Add this line to import the Book class

namespace HamraKitab.Data // Adjust this namespace as needed
{
    public class MongoDbContext
    {
        private readonly IMongoDatabase _database;

        public MongoDbContext(IConfiguration configuration)
        {
            var client = new MongoClient(configuration.GetConnectionString("DefaultConnection"));
            _database = client.GetDatabase("HamraKitab");
        }

        public IMongoCollection<Book> Books => _database.GetCollection<Book>("Books");
    }
}