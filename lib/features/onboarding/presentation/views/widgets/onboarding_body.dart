import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/features/onboarding/presentation/manager/on_boarding_cubit.dart';
import 'package:pollo/features/onboarding/presentation/manager/on_boarding_state.dart';
import 'package:pollo/features/onboarding/presentation/views/widgets/onboarding_next_button.dart';
import 'package:pollo/features/onboarding/presentation/views/widgets/onboarding_page.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit,OnboardingState>(
      builder: (context, state) {
        return Stack(
          children: [
            OnboardingPage(
              key: ValueKey(state),
            ).animate().fadeIn(duration: 600.ms).slideY(
              begin: 0.3,
              end: 0,
              duration: 600.ms,
              curve: Curves.easeOut,
            ),
            Positioned(
              bottom: 60.h,
              right: 20.w,
              child: NextButton(
                onNext: () => context.read<OnboardingCubit>().nextPage(context),
              ).animate().fadeIn(duration: 600.ms).slideY(
                begin: 0.3,
                end: 0,
                duration: 600.ms,
                curve: Curves.easeOut,
              ),
            ),
          ],
        );
      },
    );
  }
}
