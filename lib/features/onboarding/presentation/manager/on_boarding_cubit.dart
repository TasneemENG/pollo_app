import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo/core/helpers/extensions.dart';
import 'package:pollo/core/routing/routes.dart'; // Import routes
import 'package:pollo/features/onboarding/data/models/onboarding_model.dart';

class OnboardingCubit extends Cubit<int> {
  final PageController pageController = PageController();

  OnboardingCubit() : super(0);

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }

  void updatePage(int page) {
    emit(page);
  }

  void nextPage(BuildContext context) {
    if (state < onboardingData.length - 1) {
      emit(state + 1);
    } else {
      context.pushReplacementNamed(Routes.loginView);
    }
  }

  void previousPage() {
    if (state > 0) {
      emit(state - 1);
    }
  }

  void skipToLastPage(BuildContext context) {
    context.pushReplacementNamed(Routes.loginView);
  }
}