import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:skill_bridge/core/routes/routes.dart';
import 'package:skill_bridge/features/authentication/presentation/forget_password/forget_password_screen.dart';
import 'package:skill_bridge/features/authentication/presentation/login/login_screen.dart';
import 'package:skill_bridge/features/authentication/presentation/register/register_screen.dart';
import 'package:skill_bridge/features/onboarding/presentation/onboarding_screen.dart';
import 'package:skill_bridge/features/project_management/presentation/project_details/project_details_screen.dart';
import 'package:skill_bridge/features/splash/presentation/splash_screen.dart';

import '../../features/contributor_management/data/models/collaborator_model.dart';
import '../../features/contributor_management/presentation/contributor_details/contributor_details_screen.dart';
import '../../features/project_management/data/models/project_model.dart';
import '../../features/project_management/presentation/main_layout/main_layout_screen.dart';


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
          builder: (_) => LoginScreen(),
        );

      case Routes.registerScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => RegisterScreen(),
        );

      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ForgetPasswordScreen(),
        );
      case Routes.mainLayoutScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => MainLayoutScreen(),
        );
      case Routes.projectDetailsScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ProjectDetailsScreen(project: settings.arguments as ProjectModel,),
        );
      case Routes.contributorDetailsScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ContributorDetailsScreen(contributor: settings.arguments as ContributorModel,),
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
