import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/features/onboarding/presentation/views/widgets/onboarding_next_button.dart';
import 'package:pollo/features/onboarding/presentation/views/widgets/onboarding_page.dart';
import 'package:pollo/features/onboarding/presentation/manager/on_boarding_cubit.dart';

class OnboardingBody extends StatelessWidget {
  final int currentPage;
  final OnboardingCubit cubit;

  const OnboardingBody({required this.currentPage, required this.cubit, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        OnboardingPage(
          currentPage: currentPage,
          cubit: cubit,
        ),

        Positioned(
          bottom: 60.h,
          right: 20.w,
          child: NextButton(onNext: cubit.nextPage),
        ),
      ],
    );
  }
}
