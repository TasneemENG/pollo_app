import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo/core/routing/routes.dart';
import 'package:pollo/features/onboarding/data/models/onboarding_model.dart';
import 'package:pollo/features/onboarding/presentation/manager/on_boarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final PageController pageController = PageController();

  OnboardingCubit() : super(const OnboardingPageChanged(0));

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }

  void updatePage(int page) {
    emit(OnboardingPageChanged(page));
  }

  void nextPage(BuildContext context) {
    final currentPage = (state as OnboardingPageChanged).currentPage; // Safe cast
    if (currentPage < onboardingData.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.pushReplacementNamed(context, Routes.loginView);
    }
  }

  void previousPage() {
    final currentPage = (state as OnboardingPageChanged).currentPage; // Safe cast
    if (currentPage > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }
  void skipToLastPage(BuildContext context) {
    pageController.animateToPage(
      onboardingData.length - 1, // Skip directly to the last page
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );

    // Once you're on the last page, navigate to the main screen
    Navigator.pushReplacementNamed(context, Routes.loginView);  // Ensure this route is correct
  }




}
