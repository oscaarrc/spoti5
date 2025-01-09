using System.ComponentModel;

namespace SpotifyClone.Services
{
    public class AuthService
    {
        // Guardar el usuario actual
        private static string? _currentUsername;

        public static string? currentUsername
        {
            get => _currentUsername;
            set
            {
                if (_currentUsername != value)
                {
                    _currentUsername = value;
                    // Actualiza el usuario actual
                    OnPropertyChanged(nameof(currentUsername));
                }
            }
        }

        public static event PropertyChangedEventHandler? PropertyChanged;

        private static void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(null, new PropertyChangedEventArgs(propertyName));
        }
    }
}
