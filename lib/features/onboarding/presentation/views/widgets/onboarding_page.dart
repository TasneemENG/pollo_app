import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/features/onboarding/data/models/onboarding_model.dart';
import 'package:pollo/features/onboarding/presentation/manager/on_boarding_cubit.dart';
import 'package:pollo/features/onboarding/presentation/manager/on_boarding_state.dart';
import 'package:pollo/features/onboarding/presentation/views/widgets/onboarding_widget.dart';
import 'package:pollo/features/onboarding/presentation/views/widgets/onboarding_top_button_row.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        final cubit = context.read<OnboardingCubit>();
        final currentPage = state.currentPage;

        return SizedBox.expand(
          child: PageView.builder(
            controller: cubit.pageController,
            itemCount: onboardingData.length,
            onPageChanged: (int page) {
              cubit.updatePage(page);
            },
            itemBuilder: (context, index) {
              final data = onboardingData[index];
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 40.h, left: 32.w, right: 32.w),
                      child: TopButtonsRow(
                        currentPage: currentPage,
                        totalPages: onboardingData.length,
                        onBack: cubit.previousPage,
                        onSkip: () {
                          cubit.skipToLastPage(context);
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
      },
    );
  }
}
