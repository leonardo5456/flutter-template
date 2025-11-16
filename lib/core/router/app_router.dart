import 'package:flutter/material.dart';

import '../../features/home/presentation/pages/home_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/language/presentation/pages/language_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';
import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../features/auth/presentation/pages/verification_code_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String settings = '/settings';

  static const String onboarding = '/onboarding';
  static const String language = '/language';

  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';
  static const String verificationCode = '/verification-code';
  static const String splash = '/splash';
  static const String profile = '/profile';
  static const String editProfile = '/profile/edit';
}

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case AppRoutes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case AppRoutes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      case AppRoutes.language:
        return MaterialPageRoute(builder: (_) => const LanguagePage());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_) => const SignupPage());
      case AppRoutes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordPage(),
        );
      case AppRoutes.verificationCode:
        return MaterialPageRoute(
          builder: (_) => const VerificationCodePage(),
        );
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case AppRoutes.profile:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case AppRoutes.editProfile:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
