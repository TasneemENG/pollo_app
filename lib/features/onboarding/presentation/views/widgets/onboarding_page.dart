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
    return BlocBuilder<OnboardingCubit, int>(
      builder: (context, state) {
        final cubit = context.read<OnboardingCubit>();

        final data = onboardingData[state];

        return Scaffold(
          body: SizedBox.expand(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40.h, left: 32.w, right: 32.w),
                  child: TopButtonsRow(
                    currentPage: state,
                    totalPages: onboardingData.length,
                    onBack: cubit.previousPage,
                    onSkip: () {
                      cubit.skipToLastPage(context);
                    },
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OnboardingWidget(
                        title: data.title,
                        subtitle: data.subtitle,
                        image: data.image,
                        currentPage: state,
                        onboardingData: onboardingData,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
