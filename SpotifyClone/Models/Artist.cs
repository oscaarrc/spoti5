using CommunityToolkit.Mvvm.ComponentModel;
using System.Collections.Generic;

namespace SpotifyClone.Models
{
    public partial class Artist : ObservableObject
    {
        [ObservableProperty]
        private string id;

        [ObservableProperty]
        private string name;

        [ObservableProperty]
        private string uri;
    }
}