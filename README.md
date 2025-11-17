# Flutter Template  
A production-ready starter template for Flutter applications.  
Built with Material 3, Provider state management, multi-environment support (LOCAL / DEV / PROD), dynamic theming, reusable architecture, and clean project structure.

## 🚀 Key Features  
- Multi-environment support (LOCAL, DEV, PROD) using `--dart-define=FLAVOR=<value>`
- Dynamic theming with Material 3  
- Provider-based ThemeNotifier  
- Modular architecture: core, shared, features  
- Reusable ApiClient with error handling  
- Local persistence using SharedPrefsService  
- Bottom Navigation Shell (Home / Profile / Settings)  
- Complete intro flow: Splash → Onboarding → Login → Home  
- Reusable UI building blocks (Loading, Error, Empty views)  
- Ready to scale with clean folder structure  

## 📂 Project Structure  
```
lib/
  main.dart
  bootstrap.dart
  app.dart
  core/
    config/
      flavor.dart
      app_config.dart
    router/
      app_router.dart
    network/
      api_client.dart
      api_exceptions.dart
    storage/
      shared_prefs_service.dart
    logging/
      app_logger.dart
    responsive/
      responsive_layout.dart
    theme/
      app_theme.dart
      theme_notifier.dart
  shared/
    widgets/
      app_button.dart
      app_scaffold.dart
      app_loading.dart
      app_error_view.dart
      app_empty_view.dart
      app_icon.dart
    services/
      snackbar_service.dart
      dialog_service.dart
  features/
    splash/
      presentation/pages/splash_page.dart
    onboarding/
      presentation/pages/onboarding_page.dart
    language/
      presentation/pages/language_page.dart
    auth/
      presentation/pages/login_page.dart
      presentation/pages/signup_page.dart
      presentation/pages/forgot_password_page.dart
      presentation/pages/verification_code_page.dart
    home/
      presentation/pages/home_shell_page.dart
      presentation/pages/home_page.dart
      presentation/pages/dashboard_page.dart
    profile/
      presentation/pages/profile_page.dart
      presentation/pages/edit_profile_page.dart
    settings/
      presentation/pages/settings_page.dart
    error/
      presentation/pages/error_404_page.dart
      presentation/pages/no_connection_page.dart
```

## 🛠 Getting Started  
```
git clone https://github.com/leonardo5456/flutter-template.git
cd flutter-template

# Install dependencies
flutter pub get

# Run in LOCAL flavor
flutter run --dart-define=FLAVOR=local

# Run in DEV flavor
flutter run --dart-define=FLAVOR=dev

# Run in PROD flavor
flutter run --dart-define=FLAVOR=prod
```

### Environment Configuration  
`app_config.dart` automatically reads the current flavor from:  
```
--dart-define=FLAVOR=local|dev|prod
```

Each flavor sets:
- `baseUrl`
- `appName`
- `Flavor` enum value

## 🎨 Theming  
- Material 3 enabled (`useMaterial3: true`)
- Dynamic seed color in Settings screen  
- Light, Dark, and System modes  
- Icons and components adapt automatically to theme  

## 📱 Intro Flow  
1. Start → SplashPage  
2. Checks `seen_onboarding` from SharedPrefs  
3. If not seen → OnboardingPage  
4. After completion → Login  
5. HomeShellPage → Home / Profile / Settings  

## 📊 Dashboard Demo  
Includes:
- Example GET request using ApiClient  
- AppLoading while fetching  
- AppErrorView on failure  
- AppEmptyView when no data  
- Sample list rendering  

## ✅ Production-Ready Recommendations  
- Customize `baseUrl` per flavor  
- Use ApiClient for all HTTP operations  
- Persist tokens securely (SharedPrefs or flutter_secure_storage)  
- Expand AppLogger for environment-based logging  
- Add i18n with Flutter localization  
- Document architecture for your team  

## 🧮 Suggested Next Steps  
- Connect to Django REST backend  
- Add business screens (Products, Cart, Checkout, etc.)  
- Add CI/CD with GitHub Actions  
- Add unit + integration tests  
- Add onboarding analytics  

## 📚 License  
MIT License — feel free to use and modify.

---

This README is intended as a professional template for developers who want a scalable Flutter architecture.






# Local (por ejemplo, apuntando a tu Django local)
flutter run --dart-define=ENV=local
flutter run --dart-define=FLAVOR=local

# Dev
flutter run --dart-define=ENV=dev
flutter run --dart-define=FLAVOR=dev

# Test
flutter run --dart-define=FLAVOR=test

# Prod
flutter run --dart-define=ENV=prod
