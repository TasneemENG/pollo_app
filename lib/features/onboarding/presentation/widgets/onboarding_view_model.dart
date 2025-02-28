import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart' show PageController;
import 'package:pollo/features/onboarding/data/models/onboarding_model.dart';

class OnboardingViewModel {
  final PageController pageController = PageController();
  int currentPage = 0;

  void nextPage() {
    if (currentPage < onboardingData.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      // Navigate to auth screen
    }
  }

  void previousPage() {
    if (currentPage > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void skipToLastPage() {
    pageController.animateToPage(
      onboardingData.length - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void updatePage(int page) {
    currentPage = page;
  }
}