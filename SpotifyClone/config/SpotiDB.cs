using Microsoft.Data.Sqlite;
using System;
using System.Collections.Generic;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace SpotifyClone.Config
{
    public class SpotiDB
    {
        private static string dbPath;
        private static string connectionString;

        public SpotiDB()
        {
            SetPath();
            connectionString = $"Data Source={dbPath}; Foreign Keys=True;";
        }

        // Establecer el Path en la bd
        private void SetPath()
        {
            if (DeviceInfo.Platform == DevicePlatform.Android)
            {
                dbPath = Path.Combine(FileSystem.AppDataDirectory, "spotidb.db");
            }
            else if (DeviceInfo.Platform == DevicePlatform.WinUI)
            {
                // Modificar para que coincida con la ruta absoluta de tu db
                dbPath = "D:\\DAM\\ADE\\SpotifyClone\\SpotifyClone\\config\\spotidb.db";
            }
            else
            {
                dbPath = "Database path not set for this platform.";
            }

            System.Diagnostics.Debug.WriteLine($"Database path: {dbPath}");
        }

        // Crear la base de datos y las tablas
        public async Task InitializeDatabaseAsync()
        {
            if (!File.Exists(dbPath))
            {
                await CreateTablesAsync();
            }
        }

        // Crear las tablas user y favourites
        private async Task CreateTablesAsync()
        {
            using (var connection = new SqliteConnection(connectionString))
            {
                await connection.OpenAsync();
                var createUserTableCommand = connection.CreateCommand();
                createUserTableCommand.CommandText = @"
                CREATE TABLE IF NOT EXISTS user (
                    username TEXT PRIMARY KEY,
                    password TEXT
                );";
                await createUserTableCommand.ExecuteNonQueryAsync();


                var createFavouritesTableCommand = connection.CreateCommand();
                createFavouritesTableCommand.CommandText = @"
                    CREATE TABLE IF NOT EXISTS favourites (
                        id INTEGER PRIMARY KEY AUTOINCREMENT,
                        user TEXT,
                        trackid TEXT,
                        FOREIGN KEY (user) REFERENCES user(username)
                    );";
                await createFavouritesTableCommand.ExecuteNonQueryAsync();

            }
        }

        // Insertar usuario
        public async Task<int> CreateUser(string username, string password)
        {
            int rowsAffected = 0;
            string hashedPassword = HashPassword(password);

            using (var connection = new SqliteConnection(connectionString))
            {
                await connection.OpenAsync();
                var insertCommand = connection.CreateCommand();
                insertCommand.CommandText =
                    @"INSERT INTO user (username, password) 
                    VALUES (@username, @password);";
                insertCommand.Parameters.AddWithValue("@username", username);
                insertCommand.Parameters.AddWithValue("@password", hashedPassword);

                rowsAffected = await insertCommand.ExecuteNonQueryAsync();
            }

            return rowsAffected;
        }

        // Editar usuario TODO: Implementar después de navidad
        public async Task<int> UpdateUser(string username, string newPassword)
        {
            int rowsAffected = 0;
            string hashedPassword = HashPassword(newPassword);

            using (var connection = new SqliteConnection(connectionString))
            {
                await connection.OpenAsync();
                var updateCommand = connection.CreateCommand();
                updateCommand.CommandText =
                    @"UPDATE user 
                    SET password = @newPassword 
                    WHERE username = @username;";
                updateCommand.Parameters.AddWithValue("@newPassword", hashedPassword);
                updateCommand.Parameters.AddWithValue("@username", username);

                rowsAffected = await updateCommand.ExecuteNonQueryAsync();
            }

            return rowsAffected;
        }



        // Verificar si el usuario existe en la bd mediante su username y password
        public async Task<bool> UserExists(string username)
        {
            using (var connection = new SqliteConnection(connectionString))
            {
                await connection.OpenAsync();
                var selectCommand = connection.CreateCommand();
                selectCommand.CommandText =
                    @"SELECT COUNT(*) 
                      FROM user 
                      WHERE username = @username";
                selectCommand.Parameters.AddWithValue("@username", username);

                var result = await selectCommand.ExecuteScalarAsync();
                return Convert.ToInt32(result) > 0;
            }
        }

        // Comprobar si el usuario existe para iniciar sesión

        public async Task<bool> logUser(string username, string password)
        {
            string hashedPassword = HashPassword(password);

            using (var connection = new SqliteConnection(connectionString))
            {
                await connection.OpenAsync();
                var selectCommand = connection.CreateCommand();
                selectCommand.CommandText =
                    @"SELECT COUNT(*) 
              FROM user 
              WHERE username = @username 
              AND password = @password;";
                selectCommand.Parameters.AddWithValue("@username", username);
                selectCommand.Parameters.AddWithValue("@password", hashedPassword);

                var result = await selectCommand.ExecuteScalarAsync();
                return Convert.ToInt32(result) > 0;
            }
        }


        // Hashear la contraseña
        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] hashBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                return BitConverter.ToString(hashBytes).Replace("-", "").ToLower();
            }
        }



        // Agregar a favoritos
        public async Task<int> AddToFavourites(string username, string trackId)
        {
            int rowsAffected = 0;

            using (var connection = new SqliteConnection(connectionString))
            {
                await connection.OpenAsync();
                var insertCommand = connection.CreateCommand();
                insertCommand.CommandText = @"
                INSERT INTO favourites (user, trackid) 
                VALUES (@username, @trackId);";
                insertCommand.Parameters.AddWithValue("@username", username);
                insertCommand.Parameters.AddWithValue("@trackId", trackId);

                rowsAffected = await insertCommand.ExecuteNonQueryAsync();
            }

            return rowsAffected;
        }

        // Eliminar de favoritos
        public async Task<int> DeleteFromFavourites(string username, string trackId)
        {
            int rowsAffected = 0;

            using (var connection = new SqliteConnection(connectionString))
            {
                await connection.OpenAsync();
                var deleteCommand = connection.CreateCommand();
                deleteCommand.CommandText = @"
            DELETE FROM favourites 
            WHERE user = @username AND trackid = @trackId;";
                deleteCommand.Parameters.AddWithValue("@username", username);
                deleteCommand.Parameters.AddWithValue("@trackId", trackId);

                rowsAffected = await deleteCommand.ExecuteNonQueryAsync();
            }

            return rowsAffected;
        }

        // Comprobar si la canción ya está en favoritos
        public async Task<bool> IsTrackFavourite(string username, string trackId)
        {
            using (var connection = new SqliteConnection(connectionString))
            {
                await connection.OpenAsync();
                var selectCommand = connection.CreateCommand();
                selectCommand.CommandText = @"
                SELECT COUNT(*) 
                FROM favourites 
                WHERE user = @username AND trackid = @trackId;";
                selectCommand.Parameters.AddWithValue("@username", username);
                selectCommand.Parameters.AddWithValue("@trackId", trackId);

                var result = await selectCommand.ExecuteScalarAsync();
                return Convert.ToInt32(result) > 0;
            }
        }


        // Comprobar cuántas canciones hay en favoritos para un usuario
        public async Task<int> CountFavouriteTracks(string username)
        {
            int count = 0;

            using (var connection = new SqliteConnection(connectionString))
            {
                await connection.OpenAsync();
                var selectCommand = connection.CreateCommand();
                selectCommand.CommandText = @"
                                            SELECT COUNT(*) 
                                            FROM favourites 
                                            WHERE user = @username;";
                selectCommand.Parameters.AddWithValue("@username", username);

                var result = await selectCommand.ExecuteScalarAsync();
                count = Convert.ToInt32(result);
            }

            return count;
        }

    }
}