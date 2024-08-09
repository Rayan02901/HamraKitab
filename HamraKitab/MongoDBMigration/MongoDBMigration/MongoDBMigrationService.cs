// MongoDBMigrationService.cs

using MongoDB.Bson;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MongoDBMigration
{
    public class MongoDBMigrationService
    {
        private readonly string _localConnectionString;
        private readonly string _atlasConnectionString;
        private readonly string _databaseName;

        public MongoDBMigrationService(string localConnectionString, string atlasConnectionString, string databaseName)
        {
            _localConnectionString = localConnectionString;
            _atlasConnectionString = atlasConnectionString;
            _databaseName = databaseName;
        }

        public async Task MigrateDatabaseAsync()
        {
            var localClient = new MongoClient(_localConnectionString);
            var atlasClient = new MongoClient(_atlasConnectionString);

            var localDatabase = localClient.GetDatabase(_databaseName);
            var atlasDatabase = atlasClient.GetDatabase(_databaseName);

            var collections = await localDatabase.ListCollectionsAsync();
            var collectionNames = await collections.ToListAsync();

            foreach (var collectionName in collectionNames)
            {
                var collection = localDatabase.GetCollection<BsonDocument>(collectionName["name"].AsString);
                var documents = await collection.Find(FilterDefinition<BsonDocument>.Empty).ToListAsync();

                var atlasCollection = atlasDatabase.GetCollection<BsonDocument>(collectionName["name"].AsString);
                if (documents.Count > 0)
                {
                    await atlasCollection.InsertManyAsync(documents);
                }
            }

            Console.WriteLine("Database migration completed successfully.");
        }
    }
}

