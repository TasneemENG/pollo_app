import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/features/onboarding/presentation/manager/on_boarding_cubit.dart';
import 'package:pollo/features/onboarding/presentation/manager/on_boarding_state.dart';
import 'package:pollo/features/onboarding/presentation/views/widgets/onboarding_body.dart';
import 'package:pollo/features/onboarding/presentation/views/widgets/onboarding_next_button.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (context, state) {
              return OnboardingBody();
            },
          ),
        ),
      ),
    );
  }
}
