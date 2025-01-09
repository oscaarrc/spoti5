using CommunityToolkit.Mvvm.ComponentModel;
using Newtonsoft.Json;

namespace SpotifyClone.Models
{
    public partial class Token : ObservableObject
    {
        [ObservableProperty]
        [JsonProperty("access_token")]
        private string accessToken;

        [ObservableProperty]
        [JsonProperty("token_type")]
        private string tokenType; //Bearer

        [ObservableProperty]
        [JsonProperty("expires_in")]
        private int expiresIn;

        public DateTime ExpirationTime { get; set; }

        public void SetExpirationTime()
        {
            ExpirationTime = DateTime.UtcNow.AddSeconds(ExpiresIn);
        }
    }
}
