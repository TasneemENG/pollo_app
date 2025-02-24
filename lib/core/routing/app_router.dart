import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic>? generateRouter(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      // case Routes.splashView:
      //   return MaterialPageRoute(
      //     builder: (context) => const SplashView(),
      //   );

      default:
        //Exit app
        return null;
    }
  }
}
