using Microsoft.Extensions.Logging;
using Microsoft.Maui.LifecycleEvents;
using Plugin.Maui.Audio;

namespace SpotifyClone
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                });

#if DEBUG
    		builder.Logging.AddDebug();
#endif
            // Services
            builder.Services.AddTransient<Services.SpotifyService>();

            // Main
            builder.Services.AddTransient<ViewModels.MainViewModel>();
            builder.Services.AddTransient<Views.MainView>();
            //Login
            builder.Services.AddTransient<Views.LoginView>();
            builder.Services.AddTransient<ViewModels.LoginViewModel>();
            //CreateAccount
            builder.Services.AddTransient<Views.CreateAccountView>();
            builder.Services.AddTransient<ViewModels.CreateAccountViewModel>();
            //Profile
            builder.Services.AddTransient<Views.ProfileView>();
            builder.Services.AddTransient<ViewModels.ProfileViewModel>();

            var app = builder.Build();



            return builder.Build();
        }
    }
}
