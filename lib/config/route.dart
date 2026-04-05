import 'package:flutter/material.dart';
import '../view/auth/splash_screen.dart';
import '../view/auth/language_selection_screen.dart';
import '../view/auth/visitor_type_screen.dart';
import '../view/auth/login_screen.dart';
import '../view/auth/otp_verification_screen.dart';
import '../view/profile/profile_setup_screen.dart';
import '../view/home/home_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String languageSelection = '/language-selection';
  static const String visitorType = '/visitor-type';
  static const String login = '/login';
  static const String otpVerification = '/otp-verification';
  static const String profileSetup = '/profile-setup';
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case languageSelection:
        return MaterialPageRoute(builder: (_) => const LanguageSelectionScreen());
      case visitorType:
        return MaterialPageRoute(builder: (_) => const VisitorTypeScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case otpVerification:
        final phoneNumber = settings.arguments as String? ?? 'Unknown';
        return MaterialPageRoute(
          builder: (_) => OtpVerificationScreen(phoneNumber: phoneNumber),
        );
      case profileSetup:
        return MaterialPageRoute(builder: (_) => const ProfileSetupScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
