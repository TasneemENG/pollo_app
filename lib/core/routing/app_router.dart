import 'package:flutter/material.dart';
import 'package:pollo/core/routing/routes.dart';
import 'package:pollo/features/auth/presentation/views/forget_password_view.dart';
import 'package:pollo/features/auth/presentation/views/login_view.dart';
import 'package:pollo/features/auth/presentation/views/signup_view.dart';
import 'package:pollo/features/auth/presentation/views/verification_view.dart';
import 'package:pollo/features/onboarding/presentation/views/splash_view.dart';
import 'route_animations.dart';

class AppRouter {
  Route<dynamic>? generateRouter(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.splashView:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case Routes.loginView:
        return RouteAnimations.buildPageRoute(
          page: const LoginView(),
          settings: settings,
          transitionType: TransitionType.fadeScale,
        );
      case Routes.signUpView:
        return RouteAnimations.buildPageRoute(
          page: const SignupView(),
          settings: settings,
          transitionType: TransitionType.slideFromBottom,
        );
      case Routes.forgotPasswordView:
        return RouteAnimations.buildPageRoute(
          page: const ForgetPasswordView(),
          settings: settings,
          transitionType: TransitionType.slideFromBottom,
        );
        case Routes.verificationView:
        return RouteAnimations.buildPageRoute(
          page: const VerificationView(),
          settings: settings,
          transitionType: TransitionType.slideFromBottom,
        );
      default:
        //Exit app
        return null;
    }
  }
}
