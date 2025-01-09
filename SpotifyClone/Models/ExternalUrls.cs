using CommunityToolkit.Mvvm.ComponentModel;

namespace SpotifyClone.Models
{
    public partial class ExternalUrls: ObservableObject
    {
        [ObservableProperty]
        public string spotify;
    }
}