import 'package:flutter/material.dart';
import 'package:pollo/core/routing/route_animations.dart';
import 'package:pollo/core/routing/routes.dart';
import 'package:pollo/features/Home/presentation/views/home_screen.dart';
import 'package:pollo/features/Home/presentation/views/main_screen.dart';
import 'package:pollo/features/auth/presentation/views/forget_password_view.dart';
import 'package:pollo/features/auth/presentation/views/login_view.dart';
import 'package:pollo/features/auth/presentation/views/signup_view.dart';
import 'package:pollo/features/auth/presentation/views/verification_view.dart';
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
        return RouteAnimations.buildPageRoute(
          page: const OnboardingView(),
          settings: settings,
          transitionType: TransitionType.fadeScale,
        );
      case Routes.mainScreen:
        return RouteAnimations.buildPageRoute(
          page:  MainScreen(),
          settings: settings,
          transitionType: TransitionType.fadeScale,
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
      case Routes.homeView:
        return RouteAnimations.buildPageRoute(
          page:  HomePage(),
          settings: settings,
          transitionType: TransitionType.slideFromBottom,
        );

      default:
        //Exit app
        return null;
    }
  }
}
