using Newtonsoft.Json;
using SpotifyClone.Models;
using System.Diagnostics;
using System.Text;


namespace SpotifyClone.Services
{
    public class SpotifyService
    {
        private Token _token;

        // Obtener el token de autenticación desde la API de Spotify.
        public async Task<bool> GetTokenAsync()
        {
            try
            {
                string clientID = "154cc7b692d64f86b77508ca166cf392";
                string clientSecret = "d611eac6188649348a142b2a3d468a76";

                string auth = Convert.ToBase64String(Encoding.UTF8.GetBytes($"{clientID}:{clientSecret}"));
                var args = new Dictionary<string, string>
                {
                    { "grant_type", "client_credentials" }
                };

                using HttpClient client = new();
                client.DefaultRequestHeaders.Add("Authorization", $"Basic {auth}");
                var content = new FormUrlEncodedContent(args);

                HttpResponseMessage response = await client.PostAsync("https://accounts.spotify.com/api/token", content);
                string responseString = await response.Content.ReadAsStringAsync();

                if (!response.IsSuccessStatusCode)
                {
                    throw new HttpRequestException($"Error al obtener el token: {response.StatusCode} - {responseString}");
                }

                _token = JsonConvert.DeserializeObject<Token>(responseString);
                _token.SetExpirationTime();
                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al obtener el token: {ex.Message}");
                return false;
            }
        }

        // Comprobar si el token ha expirado
        private bool TokenExpired()
        {
            return _token?.ExpirationTime == null || DateTime.UtcNow >= _token.ExpirationTime;
        }

        // Asegurar que el token existe / sigue activo
        private async Task EnsureTokenAsync()
        {
            if (_token == null || string.IsNullOrEmpty(_token.AccessToken) || TokenExpired())
            {
                await GetTokenAsync();
            }
        }


        // Buscar un artista o canción en Spotify.
        public async Task<SpotifyResult> SearchSongAsync(string searchWord)
        {
            if (string.IsNullOrWhiteSpace(searchWord))
            {
                throw new ArgumentException("El término de búsqueda no puede estar vacío.", nameof(searchWord));
            }

            await EnsureTokenAsync();

            try
            {
                using HttpClient client = new();
                client.DefaultRequestHeaders.Add("Authorization", $"Bearer {_token.AccessToken}");
                client.DefaultRequestHeaders.Add("Accept", "application/json");

                string endpoint = $"https://api.spotify.com/v1/search?q={Uri.EscapeDataString(searchWord)}&type=track";
                Console.WriteLine($"URL de búsqueda: {endpoint}");

                HttpResponseMessage response = await client.GetAsync(endpoint);

                if (!response.IsSuccessStatusCode)
                {
                    string errorResponse = await response.Content.ReadAsStringAsync();
                    Console.WriteLine($"Error en la búsqueda: {response.StatusCode} - {errorResponse}");
                    return null;
                }

                string responseString = await response.Content.ReadAsStringAsync();
                return JsonConvert.DeserializeObject<SpotifyResult>(responseString);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al buscar en Spotify: {ex.Message}");
                return null;
            }
        }


        // Abrir canción en la aplicación oficial de Spotify
        public void OpenTrackInSpotify(string trackId) {

            string spotifyUri = $"spotify:track:{trackId}";

            try
            {
                var spotifyProcesses = Process.GetProcessesByName("Spotify");

                // Cerrar procesos de Spotify en caso de que existan
                if (spotifyProcesses.Length > 0)
                {
                    foreach (var process in spotifyProcesses)
                    {
                        process.Kill();
                    }
                }

                Process.Start(new ProcessStartInfo
                {
                    FileName = spotifyUri,
                    UseShellExecute = true
                });
                Console.WriteLine($"Abriendo la canción con URI: {spotifyUri}");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al abrir Spotify: {ex.Message}");
            }
        }
    }
}
