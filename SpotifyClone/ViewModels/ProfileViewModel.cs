using System.Windows.Input;
using SpotifyClone.Services;
using SpotifyClone.Config;
using System.ComponentModel;
using System.Diagnostics.Metrics;

namespace SpotifyClone.ViewModels
{
    public class ProfileViewModel : BindableObject
    {
        private string? userName;
        private int _favouriteCount;
        private readonly SpotiDB _database;

        // Evento de cambio de propiedad
        public event PropertyChangedEventHandler PropertyChanged;

        // Command
        public ICommand LogoutCommand { get; }
        public ICommand NavigateToMainViewCommand { get; }

        public ProfileViewModel()
        {

            _database = new SpotiDB();

            // Recibir notificacion cuando una propiedad de AuthService cambia para el UserName
            AuthService.PropertyChanged += (sender, args) =>
            {
                if (args.PropertyName == nameof(AuthService.currentUsername))
                {
                    UserName = AuthService.currentUsername;
                }
            };

            // Inicializar con valor actual
            UserName = AuthService.currentUsername;

            LogoutCommand = new Command(Logout);
            NavigateToMainViewCommand = new Command(NavigateToMainView);

            // Actualizar al iniciar
            UpdateFavouriteCount();
        }

        public string? UserName
        {
            get => userName;
            set
            {
                userName = value;
                OnPropertyChanged();
            }
        }

        // Conteo de favoritos
        public int FavouriteCount
        {
            get => _favouriteCount;
            set
            {
                _favouriteCount = value;
                PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(nameof(FavouriteCount)));
            }
        }

        // Actualizar el conteo de canciones favoritas
        private async void UpdateFavouriteCount()
        {
            if (!string.IsNullOrEmpty(UserName))
            {
                FavouriteCount = await _database.CountFavouriteTracks(UserName);
            }
        }

        // Cerrar sesión
        private async void Logout()
        {
            AuthService.currentUsername = null;
            await Shell.Current.GoToAsync("//LoginView", true);
        }

        // Navegar a la vista principal
        private async void NavigateToMainView()
        {
            await Shell.Current.GoToAsync("//MainView");
        }
    }
}
