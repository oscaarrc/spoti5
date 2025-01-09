using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using SpotifyClone.Config;
using SpotifyClone.Models;
using SpotifyClone.Services;
using System.Collections.ObjectModel;
using System.Windows.Input;
using Image = SpotifyClone.Models.Image;

namespace SpotifyClone.ViewModels
{
    public partial class MainViewModel : ObservableObject
    {
        private readonly SpotifyService _spotifyService = new();
        private readonly SpotiDB _dbService;

        // ObservableProperty
        [ObservableProperty]
        private ObservableCollection<Track> _tracks = new ObservableCollection<Track>();

        [ObservableProperty]
        private string _searchWord;

        [ObservableProperty]
        private string _favoriteButtonSource = "empty_heart.png";

        [ObservableProperty]
        private bool _isFavorite = false;



        // Command
        public IAsyncRelayCommand SearchCommand { get; }
        public IRelayCommand<Track> PlayCommand { get; }
        public IAsyncRelayCommand<Track> AddToFavouritesCommand { get; }
        public ICommand NavigateToProfileViewCommand { get; }




        public MainViewModel()
        {
            _dbService = new SpotiDB();
            _tracks = new ObservableCollection<Track>();
            SearchCommand = new AsyncRelayCommand(ExecuteSearchAsync);
            PlayCommand = new RelayCommand<Track>(ExecutePlay);
            AddToFavouritesCommand = new AsyncRelayCommand<Track>(AddToFavouritesAsync);
            NavigateToProfileViewCommand = new Command(NavigateToProfileView);
        }

        // Buscar canciones
        private async Task ExecuteSearchAsync()
        {
            try
            {
                if (string.IsNullOrWhiteSpace(SearchWord))
                {
                    return;
                }

                await _spotifyService.GetTokenAsync();
                var searchResult = await _spotifyService.SearchSongAsync(SearchWord);

                if (searchResult?.Tracks?.Items == null)
                {
                    return;
                }

                // Limpia la lista de tracks antes de volver a insertar las nuevas canciones
                _tracks.Clear();

                foreach (var track in searchResult.Tracks.Items)
                {

                    // Album
                    var album = new Album
                    {
                        Id = track.Album.Id,
                        Name = track.Album.Name,
                        Images = track.Album.Images?.Select(img => new Image
                        {
                            Url = img.Url,
                            Height = img.Height,
                            Width = img.Width
                        }).ToList() ?? new List<Image>()
                    };

                    // Canción
                    _tracks.Add(new Track
                    {
                        Id = track.Id,
                        Name = track.Name,
                        DurationMs = track.DurationMs,
                        PreviewUrl = track.PreviewUrl,
                        Uri = track.Uri,
                        Album = album,
                        Artists = track.Artists?.Select(artist => new Artist
                        {
                            Name = artist.Name
                        }).ToList()
                    });
                }

            }
            catch (Exception ex)
            {
                await App.Current.MainPage.DisplayAlert("Error en la búsqueda", "Error al realizar la búsqueda: "+ ex.Message , "Aceptar");
            }
        }

        // Abrir spotify para escuchar la canción seleccionada
        public async void ExecutePlay(Track track)
        {
            _spotifyService.OpenTrackInSpotify(track.Id);
        }

        // TODO: Añadir a favoritos (en navidad porque no da tiempo) 
        private async Task AddToFavouritesAsync(Track track)
        {
            string? username = AuthService.currentUsername;

            if (track != null && !string.IsNullOrEmpty(username))
            {
                string trackId = track.Id;
                IsFavorite = await _dbService.IsTrackFavourite(username, trackId);

                if (IsFavorite)
                {
                    // Eliminar de favoritos
                    int result = await _dbService.DeleteFromFavourites(username, trackId);

                    if (result > 0)
                    {
                        FavoriteButtonSource = "empty_heart.png";
                        IsFavorite = false;
                    }
                    else
                    {
                        await App.Current.MainPage.DisplayAlert("Error", "No se pudo eliminar de favoritos.", "Aceptar");
                    }
                }
                else
                {
                    // Añadir a favoritos
                    int result = await _dbService.AddToFavourites(username, trackId);

                    if (result > 0)
                    {
                        FavoriteButtonSource = "favorito.png";
                        IsFavorite = true;
                    }
                    else
                    {
                        await App.Current.MainPage.DisplayAlert("Error", "No se pudo agregar a favoritos.", "Aceptar");
                    }
                }
            }
        }


        private async void NavigateToProfileView()
        {
            SearchWord = string.Empty;
            _tracks.Clear();
            await Shell.Current.GoToAsync("//ProfileView");
        }
    }
}
