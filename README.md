# Flutter Template  
A production-ready starter template for Flutter applications.  
Built with Material 3, Provider state management, multi-environment support (LOCAL / DEV / PROD), dynamic theming, reusable architecture, and clean project structure.

## 🚀 Key Features  
- Multi-environment support using `--dart-define=ENV=<value>`  
- Multi-configuration support using `--dart-define=FLAVOR=<value>`  
- Dynamic theming with Material 3  
- Provider-based ThemeNotifier  
- Modular architecture (core / shared / features)  
- Reusable ApiClient with error handling  
- Local persistence using SharedPrefsService  
- Bottom Navigation Shell (Home / Profile / Settings)  
- Complete intro flow: Splash → Onboarding → Login → Home  
- Reusable UI building blocks (Loading, Error, Empty views)  
- Integrated unit & widget testing  
- Ready to scale for multi-tenant (config1/config2/config3)

---

## 🔧 Environment & Flavor Configuration

This template supports two parallel configuration systems:

### 🟢 1. ENV (Backend Environment)

ENV controls which backend the app connects to:

- `local` → Local Django backend  
- `dev` → Development server  
- `prod` → Production server  

Run:

```bash
flutter run --dart-define=ENV=local
flutter run --dart-define=ENV=dev
flutter run --dart-define=ENV=prod
```

ENV parser:

```dart
enum Env { local, dev, prod }

Env parseEnv(String value) {
  switch (value.toLowerCase()) {
    case 'dev':  return Env.dev;
    case 'prod': return Env.prod;
    default:     return Env.local;
  }
}
```

---

### 🔵 2. FLAVOR (Client / Configuration)

Flavors define **client variants**, useful for white‑label or multi‑tenant apps.

```dart
enum Flavor { config1, config2, config3 }

String flavorName(Flavor flavor) {
  switch (flavor) {
    case Flavor.config1: return 'CONFIG 1';
    case Flavor.config2: return 'CONFIG 2';
    case Flavor.config3: return 'CONFIG 3';
  }
}
```

Run:

```bash
flutter run --dart-define=FLAVOR=config1
flutter run --dart-define=FLAVOR=config2
flutter run --dart-define=FLAVOR=config3
```

---

### 🟣 Combine ENV + FLAVOR

```bash
flutter run --dart-define=ENV=dev --dart-define=FLAVOR=config2
```

This allows:

- config1 + prod  
- config2 + dev  
- config3 + local  
- …any combination

---

## 📂 Project Structure  

```
lib/
  main.dart
  bootstrap.dart
  app.dart
  core/
    config/
      env.dart
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
test/
  core/
    theme/theme_notifier_test.dart
    network/api_client_test.dart
  features/
    settings/settings_page_test.dart
```

---

## 🛠 Getting Started  

```bash
git clone https://github.com/leonardo5456/flutter-template.git
cd flutter-template

flutter pub get
```

### Run with ENV & FLAVOR

```bash
# Local backend
flutter run --dart-define=ENV=local --dart-define=FLAVOR=config1

# Development
flutter run --dart-define=ENV=dev --dart-define=FLAVOR=config2

# Production
flutter run --dart-define=ENV=prod --dart-define=FLAVOR=config3
```

---

## 🎨 Theming  
- Material 3 enabled  
- Dynamic seed color selector  
- Light / Dark / System modes  
- ThemeNotifier with Provider  

---

## 📱 Intro Flow  
1. Splash → checks onboarding flag  
2. Onboarding (Skip or Finish saves `seen_onboarding`)  
3. Login  
4. HomeShell with bottom navigation  

---

## 📊 Dashboard Demo  
Includes:

- GET request via ApiClient  
- Loading + error + empty states  
- UI scaffolding ready to connect to real backend  

---

## 🧪 Testing  
Included tests:

- ThemeNotifier unit test  
- ApiClient unit test with MockClient  
- SettingsPage widget test with Provider  

Run tests:

```bash
flutter test
```

---

## 🧩 Recommended Next Steps  
- Connect Django REST backend  
- Add more features and screens  
- Implement CI/CD with GitHub Actions  
- Configure native flavors (icons, bundle IDs)  
- Add localization (i18n)

---

## 📚 License  
MIT License — feel free to modify and use.
