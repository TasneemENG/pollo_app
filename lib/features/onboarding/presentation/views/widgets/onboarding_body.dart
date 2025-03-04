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
    return BlocBuilder<OnboardingCubit, int>(  // Using int as the state type instead of OnboardingState
      builder: (context, currentPage) {   // currentPage will be an int, which is the page index
        return Stack(
          children: [
            // Passing currentPage as the key, so that page transitions correctly
            OnboardingPage(
              key: ValueKey(currentPage),  // Use currentPage to differentiate between page changes
            ).animate().fadeIn(duration: 600.ms).slideX(
              begin: -0.3, // Start the page from the left
              end: 0, // End at the normal position
              duration: 600.ms,
              curve: Curves.easeOut,
            ),
            Positioned(
              bottom: 60.h,
              right: 20.w,
              child: NextButton(
                onNext: () => context.read<OnboardingCubit>().nextPage(context),
              ).animate().fadeIn(duration: 600.ms).slideX(
                begin: 0.3, // Start the button from the right
                end: 0, // End at the normal position
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
