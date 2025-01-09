using CommunityToolkit.Mvvm.ComponentModel;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SpotifyClone.Models
{
    public partial class Track : ObservableObject
    {
        [ObservableProperty]
        private string id;
        [ObservableProperty]
        private string name;
        [ObservableProperty]
        private int durationMs; // Duración en milisegundos
        [ObservableProperty]
        private Album album;
        [ObservableProperty]
        public List<Image> images;
        [ObservableProperty]
        private List<Artist> artists;
        [ObservableProperty]
        [JsonProperty("preview_url")]
        private string previewUrl; // Deprecated :(
        [ObservableProperty]
        private string uri;
    }
}
