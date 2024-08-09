using MongoDB.Bson;
using MongoDB.Driver;
using System;

namespace HamraKitab.Services
{
    public class MongoDBService
    {
        private readonly MongoClient _client;
        private readonly IMongoDatabase _database;

        public MongoDBService()
        {
            const string connectionUri = "mongodb + srv://rayan077:20590617%40Garima@hamrakitab.cbbrfex.mongodb.net/?retryWrites=true&w=majority&appName=hamrakitab";
            //const string connectionUri = "mongodb://127.0.0.1:27017/hamrakitab";
            var settings = MongoClientSettings.FromConnectionString(connectionUri);
            settings.ServerApi = new ServerApi(ServerApiVersion.V1);
            _client = new MongoClient(settings);
            _database = _client.GetDatabase("admin");
        }

        public void PingDatabase()
        {
            try
            {
                var result = _database.RunCommand<BsonDocument>(new BsonDocument("ping", 1));
                Console.WriteLine("Pinged your deployment. You successfully connected to MongoDB!");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
    }
}
