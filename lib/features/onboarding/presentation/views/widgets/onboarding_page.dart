import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/features/onboarding/data/models/onboarding_model.dart';
import 'package:pollo/features/onboarding/presentation/manager/on_boarding_cubit.dart';
import 'package:pollo/features/onboarding/presentation/views/widgets/onboarding_widget.dart';
import 'package:pollo/features/onboarding/presentation/views/widgets/onboarding_top_button_row.dart';

class OnboardingPage extends StatelessWidget {
  final int currentPage;

  const OnboardingPage({required this.currentPage, super.key});

  @override
  Widget build(BuildContext context) {
    final cubit =context.read<OnboardingCubit>();
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
                Padding(
                  padding: EdgeInsets.only(top: 40.h, left: 32.w, right: 32.w),
                  child: TopButtonsRow(
                    currentPage: currentPage,
                    totalPages: onboardingData.length,
                    onBack: cubit.previousPage,
                    onSkip: () {
                      cubit.skipToLastPage(context); // Wrap in an anonymous function
                    },

                  ),
                ),
                OnboardingWidget(
                  title: data.title,
                  subtitle: data.subtitle,
                  image: data.image,
                  currentPage: currentPage,
                  onboardingData: onboardingData,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
