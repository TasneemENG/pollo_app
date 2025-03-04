import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/features/onboarding/data/models/onboarding_model.dart';
import 'package:pollo/features/onboarding/presentation/manager/on_boarding_cubit.dart';
import 'package:pollo/features/onboarding/presentation/views/widgets/onboarding_widget.dart';
import 'package:pollo/features/onboarding/presentation/views/widgets/onboarding_top_button_row.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a PageController to handle page changes
    final PageController pageController = PageController();

    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40.h, left: 32.w, right: 32.w),
              child: BlocBuilder<OnboardingCubit, int>(
                builder: (context, currentPage) {
                  return TopButtonsRow(
                    currentPage: currentPage,
                    totalPages: onboardingData.length,
                    onBack: () {
                      // Going to previous page
                      if (currentPage > 0) {
                        pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    },
                    onSkip: () {
                      // Skipping to the last page
                      pageController.jumpToPage(onboardingData.length - 1);
                    },
                  );
                },
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: onboardingData.length,
                onPageChanged: (int page) {
                  context.read<OnboardingCubit>().updatePage(page);
                },
                itemBuilder: (context, index) {
                  final data = onboardingData[index];

                  return OnboardingWidget(
                    title: data.title,
                    subtitle: data.subtitle,
                    image: data.image,
                    currentPage: index,
                    onboardingData: onboardingData,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
