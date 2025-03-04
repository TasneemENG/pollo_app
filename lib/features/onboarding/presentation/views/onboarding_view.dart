import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo/features/onboarding/presentation/manager/on_boarding_cubit.dart';
import 'package:pollo/features/onboarding/presentation/views/widgets/onboarding_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<OnboardingCubit,int>(
            builder: (context, state) {
              return const OnboardingBody();
            },
          ),
        ),
      ),
    );
  }
}
