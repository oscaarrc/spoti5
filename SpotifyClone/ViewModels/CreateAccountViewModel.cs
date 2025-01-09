using System.ComponentModel;
using System.Windows.Input;
using SpotifyClone.Config;

namespace SpotifyClone.ViewModels
{
    public class CreateAccountViewModel : INotifyPropertyChanged // Notificar a la interfaz de usuario
                                                                 // cuando una propiedad ha cambiado.
    {
        private string _username;
        private string _password;

        public event PropertyChangedEventHandler PropertyChanged;

        public string Username
        {
            get => _username;
            set
            {
                _username = value;
                // Notificar a la interfaz de que la propiedad ha cambiado.
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

        //Command
        public ICommand CreateAccountCommand { get; }
        public ICommand NavigateToLoginCommand { get; }


        public CreateAccountViewModel()
        {
            CreateAccountCommand = new Command(async () => await CreateAccount());
            NavigateToLoginCommand = new Command(NavigateToLogin);
        }

        // Crear cuenta
        private async Task CreateAccount() {

            if (string.IsNullOrWhiteSpace(Username) || string.IsNullOrWhiteSpace(Password))
            {
                await App.Current.MainPage.DisplayAlert("Error al crear cuenta", "Por favor, complete todos los campos.", "Aceptar");
                return;
            }

            var db = new SpotiDB();

            // Verificar si el usuario ya existe
            bool userExists = await db.UserExists(Username);

            if (userExists)
            {
                await Application.Current.MainPage.DisplayAlert("Error", "El nombre de usuario no está disponible", "Aceptar");
            }
            else
            {
                int result = await db.CreateUser(Username, Password);

                if (result > 0)
                {
                    await Shell.Current.GoToAsync("//LoginView");
                }
                else
                {
                    await Application.Current.MainPage.DisplayAlert("Error", "Hubo un error al crear la cuenta", "Aceptar");
                }
            }
        }

        // Navegar a la vista de Login
        private async void NavigateToLogin()
        {
            await Shell.Current.GoToAsync("//LoginView");
        }
    }
}
