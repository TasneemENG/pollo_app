import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/features/onboarding/data/models/onboarding_model.dart';
import 'package:pollo/features/onboarding/presentation/manager/on_boarding_cubit.dart';
import 'package:pollo/features/onboarding/presentation/views/widgets/onboarding_widget.dart';
import 'package:pollo/features/onboarding/presentation/views/widgets/top_button_row.dart';

class OnboardingPage extends StatelessWidget {
  final int currentPage;
  final OnboardingCubit cubit;

  const OnboardingPage({
    required this.currentPage,
    required this.cubit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: PageView.builder(
        controller: cubit.pageController,
        itemCount: onboardingData.length,
        onPageChanged: (int page) {
          cubit.updatePage(page); // Update page using Cubit
        },
        itemBuilder: (context, index) {
          final data = onboardingData[index];

          return SingleChildScrollView(
            child: Column(
              children: [
                _buildTopRow(context), // Extracted top row widget
                _buildOnboardingContent(data, context), // Pass context to onNext
              ],
            ),
          );
        },
      ),
    );
  }

  // Extracted method for the top buttons row
  Widget _buildTopRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.h, left: 32.w, right: 32.w),
      child: TopButtonsRow(
        currentPage: currentPage,
        totalPages: onboardingData.length,
        onBack: cubit.previousPage,
        onSkip: () => cubit.skipToLastPage(context),  // Pass context for navigation
      ),
    );
  }

  // Extracted method for the onboarding widget
  Widget _buildOnboardingContent(OnboardingModel data, BuildContext context) {
    return OnboardingWidget(
      title: data.title,
      subtitle: data.subtitle,
      image: data.image,
      onNext: () => cubit.nextPage(context),  // Pass context inside a closure
      currentPage: currentPage,
      onboardingData: onboardingData,
    );
  }
}
