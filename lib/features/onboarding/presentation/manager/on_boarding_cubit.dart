import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo/core/routing/routes.dart';
import 'package:pollo/features/onboarding/data/models/onboarding_model.dart';
import 'package:pollo/features/onboarding/presentation/manager/on_boarding_state.dart';
import 'package:flutter/material.dart'; // Required for navigation

class OnboardingCubit extends Cubit<OnboardingState> {
  final PageController pageController = PageController();

  OnboardingCubit() : super(const OnboardingInitial());

  void updatePage(int page) {
    emit(OnboardingPageChanged(page));
  }

  void nextPage(BuildContext context) {
    if (state is OnboardingPageChanged && (state as OnboardingPageChanged).currentPage < onboardingData.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      // Navigate to the main screen
      navigateToMainScreen(context);
    }
  }

  void previousPage() {
    if (state is OnboardingPageChanged && (state as OnboardingPageChanged).currentPage > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void skipToLastPage(BuildContext context) {
    pageController.animateToPage(
      onboardingData.length - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    navigateToMainScreen(context);
  }

  void navigateToMainScreen(BuildContext context) {

    Navigator.pushReplacementNamed(context, Routes.mainScreen);
  }
}
