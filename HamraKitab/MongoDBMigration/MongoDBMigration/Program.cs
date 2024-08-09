// Program.cs

using System;
using System.Threading.Tasks;

namespace MongoDBMigration
{
    class Program
    {
        static async Task Main(string[] args)
        {
            var localConnectionString = "";
            var atlasConnectionString = "";
            var databaseName = "hamrakitab";

            var migrationService = new MongoDBMigrationService(localConnectionString, atlasConnectionString, databaseName);
            await migrationService.MigrateDatabaseAsync();
        }
    }
}
