using System.ComponentModel;
using System.Windows.Input;
using SpotifyClone.Config;
using SpotifyClone.Services;

namespace SpotifyClone.ViewModels
{
    public class LoginViewModel : INotifyPropertyChanged
    {
        private string _username;
        private string _password;
        private readonly SpotiDB _database;

        public event PropertyChangedEventHandler PropertyChanged;

        public string Username
        {
            get => _username;
            set
            {
                _username = value;
                PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(nameof(Username)));
            }
        }

        public string Password
        {
            get => _password;
            set
            {
                _password = value;
                PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(nameof(Password)));
            }
        }

        // Command
        public ICommand LoginCommand { get; }
        public ICommand NavigateToCreateAccountCommand { get; }


        public LoginViewModel()
        {
            _database = new SpotiDB();
            LoginCommand = new Command(Login);
            NavigateToCreateAccountCommand = new Command(NavigateToCreateAccount);
        }

        // Iniciar sesión
        private async void Login()
        {

            if (string.IsNullOrWhiteSpace(Username) || string.IsNullOrWhiteSpace(Password))
            {
                await App.Current.MainPage.DisplayAlert("Error al iniciar sesión", "Por favor, complete todos los campos.", "Aceptar");
                return;
            }
            bool userExists = await _database.logUser(Username, Password);
            if (userExists)
            {
                AuthService.currentUsername = Username;
                await Shell.Current.GoToAsync("//MainView");
                ResetForm();
            }
            else
            {
                await App.Current.MainPage.DisplayAlert("Error al iniciar sesión", "Usuario o contraseña no válidos.", "Aceptar");
            }
        }

        // Resetea los campos a vacío
        private void ResetForm()
        {
            Username = string.Empty;
            Password = string.Empty;
        }

        // Navegar a la vista de CreateAccount
        private async void NavigateToCreateAccount()
        {
            await Shell.Current.GoToAsync("//CreateAccountView");
        }
    }
}
