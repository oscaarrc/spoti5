using CommunityToolkit.Mvvm.ComponentModel;

namespace SpotifyClone.Models
{

    public partial class SpotifyResult: ObservableObject
    {
        [ObservableProperty]
        private TrackResult tracks;
    }
    

}
