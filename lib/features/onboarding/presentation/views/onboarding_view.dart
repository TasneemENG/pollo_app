import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/features/onboarding/data/manager/on_boarding_cubit.dart';
import 'package:pollo/features/onboarding/data/manager/on_boarding_state.dart';
import 'package:pollo/features/onboarding/presentation/widgets/top_button_row.dart';
import 'package:pollo/features/onboarding/presentation/widgets/onboarding_buttons.dart';
import 'package:pollo/features/onboarding/presentation/widgets/onboarding_widget.dart';
import '../../data/models/onboarding_model.dart';


class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(), // Provide the Cubit
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (context, state) {
              final cubit = context.read<OnboardingCubit>();
              final currentPage = state is OnboardingPageChanged ? state.currentPage : 0;

              return Stack(
                children: [
                  // PageView for onboarding screens
                  SizedBox.expand(
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
                              // Top Row with Back and Skip Buttons
                              Padding(
                                padding: EdgeInsets.only(top: 40.h, left: 32.w, right: 32.w),
                                child: TopButtonsRow(
                                  currentPage: currentPage, // Use currentPage from state
                                  totalPages: onboardingData.length,
                                  onBack: cubit.previousPage,
                                  onSkip: cubit.skipToLastPage,
                                ),
                              ),
                              // Onboarding Widget
                              OnboardingWidget(
                                title: data.title,
                                subtitle: data.subtitle,
                                image: data.image,
                                onNext: cubit.nextPage,
                                currentPage: currentPage, // Use currentPage from state
                                onboardingData: onboardingData,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  // ButtonRow Positioned at the Bottom Right
                  Positioned(
                    bottom: 60.h, // Adjust the distance from the bottom
                    right: 20.w, // Adjust the distance from the right
                    child: ButtonRow(onNext: cubit.nextPage),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}