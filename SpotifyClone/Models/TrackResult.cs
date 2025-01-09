using System;
using CommunityToolkit.Mvvm.ComponentModel;
using System.Collections.Generic;

namespace SpotifyClone.Models
{
    public partial class TrackResult : ObservableObject
    {
        [ObservableProperty]
        private List<Track> items;
    }
}
