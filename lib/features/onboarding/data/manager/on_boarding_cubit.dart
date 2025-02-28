import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo/features/onboarding/data/manager/on_boarding_state.dart';
import 'package:pollo/features/onboarding/data/models/onboarding_model.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final PageController pageController = PageController();

  OnboardingCubit() : super(const OnboardingInitial()); // Initial state

  void updatePage(int page) {
    emit(OnboardingPageChanged(page)); // Emit a new state when the page changes
  }

  void nextPage() {
    if (state is OnboardingPageChanged && (state as OnboardingPageChanged).currentPage < onboardingData.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      // Navigate to auth screen
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

  void skipToLastPage() {
    pageController.animateToPage(
      onboardingData.length - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }
}