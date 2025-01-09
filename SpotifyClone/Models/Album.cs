using CommunityToolkit.Mvvm.ComponentModel;

namespace SpotifyClone.Models
{
    public partial class Album : ObservableObject
    {
        [ObservableProperty]
        private string id;

        [ObservableProperty]
        private string name;

        [ObservableProperty]
        private List<Image> images;
    }
}
