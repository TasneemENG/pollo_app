import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo/core/helpers/extensions.dart';
import 'package:pollo/core/routing/routes.dart'; // Import routes
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
    final currentPage = (state as OnboardingPageChanged).currentPage;
    if (currentPage < onboardingData.length - 1) {
      emit(OnboardingPageChanged(currentPage + 1));
    } else {
    context.pushReplacementNamed(Routes.loginView);
    }
  }

  void previousPage() {
    final currentPage = (state as OnboardingPageChanged).currentPage;
    if (currentPage > 0) {
      emit(OnboardingPageChanged(currentPage - 1)); // Update content index
    }
  }

  void skipToLastPage(BuildContext context) {
    context.pushReplacementNamed(Routes.loginView);
  }
}