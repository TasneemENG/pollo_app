import 'package:flutter/material.dart';
import 'package:pollo/core/routing/routes.dart';
import 'package:pollo/features/Home/presentation/views/main_screen.dart';
import 'package:pollo/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:pollo/features/onboarding/presentation/views/splash_view.dart';

class AppRouter {
  Route<dynamic>? generateRouter(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.splashView:
        return MaterialPageRoute(
          builder: (context) => SplashView(),
        );
      case Routes.onboardingView:
        return MaterialPageRoute(
            builder:(context) => OnboardingView() );
      case Routes.mainScreen:
        return MaterialPageRoute(
          builder: (context) => MyHomePage()
        );
      default:
        //Exit app
        return null;
    }
  }
}
