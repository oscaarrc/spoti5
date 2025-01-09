using SpotifyClone.Config;
using SpotifyClone.Views;

namespace SpotifyClone
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();
            InitializeDatabase();
            MainPage = new AppShell();
            Shell.Current.GoToAsync("//LoginView"); // Navega a LoginView al iniciar la app
        }

        private async void InitializeDatabase()
        {
            var spotiDB = new SpotiDB();
            await spotiDB.InitializeDatabaseAsync();
        }
    }
}
