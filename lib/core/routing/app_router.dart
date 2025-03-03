import 'package:flutter/material.dart';
import 'package:pollo/core/routing/route_animations.dart';
import 'package:pollo/core/routing/routes.dart';
import 'package:pollo/core/widgets/app_nav_bar.dart';
import 'package:pollo/features/category/data/category.dart';
import 'package:pollo/features/Home/presentation/views/home_view.dart';
import 'package:pollo/features/auth/presentation/views/forget_password_view.dart';
import 'package:pollo/features/auth/presentation/views/login_view.dart';
import 'package:pollo/features/auth/presentation/views/reset_password_view.dart';
import 'package:pollo/features/auth/presentation/views/signup_view.dart';
import 'package:pollo/features/auth/presentation/views/verification_view.dart';
import 'package:pollo/features/category/presentation/views/category_view.dart';
import 'package:pollo/features/favorite/presentation/views/favorite_view.dart';
import 'package:pollo/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:pollo/features/onboarding/presentation/views/splash_view.dart';
import 'package:pollo/features/product/presentation/views/product_view.dart';
import 'package:pollo/features/product_details/presentation/views/product_details_view.dart';
import 'package:pollo/features/profile/presentation/views/profile_view.dart';

class AppRouter {
  Route<dynamic>? generateRouter(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.splashView:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case Routes.onboardingView:
        return RouteAnimations.buildPageRoute(
          page: const OnboardingView(),
          settings: settings,
          transitionType: TransitionType.fadeScale,
        );
      case Routes.appNavBar:
        return RouteAnimations.buildPageRoute(
          page: const AppNavBar(),
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
          transitionType: TransitionType.slideFromLeft,
        );
      case Routes.forgotPasswordView:
        return RouteAnimations.buildPageRoute(
          page: const ForgetPasswordView(),
          settings: settings,
          transitionType: TransitionType.slideFromLeft,
        );
      case Routes.verificationView:
        return RouteAnimations.buildPageRoute(
          page: const VerificationView(),
          settings: settings,
          transitionType: TransitionType.slideFromLeft,
        );
      case Routes.resetPasswordView:
        return RouteAnimations.buildPageRoute(
          page: const ResetPasswordView(),
          settings: settings,
          transitionType: TransitionType.slideFromLeft,
        );
      case Routes.homeView:
        return RouteAnimations.buildPageRoute(
          page: const HomeView(),
          settings: settings,
          transitionType: TransitionType.slideFromLeft,
        );
      case Routes.productView:
        return RouteAnimations.buildPageRoute(
          page: const ProductView(),
          settings: settings,
          transitionType: TransitionType.slideFromLeft,
        );

      case Routes.categoryWidget:
        // Ensure arguments are passed and are of the correct type
        if (arguments is Map<String, dynamic>) {
          final List<Category> categories = arguments['categories'];
          final String categoryName = arguments['categoryName'];
          final String image = arguments['image'];
          return RouteAnimations.buildPageRoute(
            page: CategoryView(
              categories: categories,
              categoryName: categoryName,
              image: image,
            ),
            settings: settings,
            transitionType: TransitionType.slideFromLeft,
          );
        } else {
          // Handle invalid arguments
          throw ArgumentError(
              'Invalid arguments passed to categoryWidget route');
        }
      case Routes.productDetailsView:
        return RouteAnimations.buildPageRoute(
          page: const ProductDetailsView(),
          settings: settings,
          transitionType: TransitionType.slideFromLeft,
        );
        case Routes.favouriteView:
        return RouteAnimations.buildPageRoute(
          page: const FavouriteView(),
          settings: settings,
          transitionType: TransitionType.slideFromLeft,);
        case Routes.profileView:
        return RouteAnimations.buildPageRoute(
          page: const ProfileView(),
          settings: settings,
          transitionType: TransitionType.slideFromLeft,);

      default:
        //Exit app
        return null;
    }
  }
}
