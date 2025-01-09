using CommunityToolkit.Mvvm.ComponentModel;

namespace SpotifyClone.Models
{
    public partial class Image : ObservableObject
    {
        [ObservableProperty]
        public string url;

        [ObservableProperty]
        public int height;

        [ObservableProperty]
        public int width;
    }
}
