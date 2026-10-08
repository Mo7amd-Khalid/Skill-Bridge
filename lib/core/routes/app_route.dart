import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:skill_bridge/core/routes/routes.dart';
import 'package:skill_bridge/features/authentication/login/presentation/login_screen.dart';
import 'package:skill_bridge/features/main_layout/presentation/main_layout_screen.dart';
import 'package:skill_bridge/features/onboarding/presentation/onboarding_screen.dart';
import 'package:skill_bridge/features/splash/presentation/splash_screen.dart';


abstract class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    if (kDebugMode) {
      print('Navigating to: ${settings.name}');
    }

    final uri = Uri.parse(settings.name ?? '/');

    switch (uri.path) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SplashScreen(),
        );

      case Routes.onboardingScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const OnboardingScreen(),
        );

      case Routes.loginScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LoginScreen(),
        );

      case Routes.mainLayoutScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const MainLayoutScreen(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) =>
              const Scaffold(body: Center(child: Text('404 - Page Not Found'))),
        );
    }
  }
}
