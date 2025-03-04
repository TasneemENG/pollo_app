import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo/core/helpers/extensions.dart';
import 'package:pollo/core/routing/routes.dart';
import 'package:pollo/features/onboarding/data/models/onboarding_model.dart'; // Import routes

class OnboardingCubit extends Cubit<int> {
  final PageController pageController = PageController();

  OnboardingCubit() : super(0); // Start at page 0

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }

  // Update current page
  void updatePage(int page) {
    emit(page);
  }

  // Go to the next page
  void nextPage(BuildContext context) {
    final currentPage = state;
    if (currentPage < onboardingData.length - 1) {
      emit(currentPage + 1); // Move to the next page
    } else {
      context.pushReplacementNamed(Routes.loginView); // Navigate to login
    }
  }

  // Go to the previous page
  void previousPage() {
    final currentPage = state;
    if (currentPage > 0) {
      emit(currentPage - 1); // Move to the previous page
    }
  }

  // Skip to the last page
  void skipToLastPage(BuildContext context) {
    context.pushReplacementNamed(Routes.loginView); // Skip to login
  }
}
