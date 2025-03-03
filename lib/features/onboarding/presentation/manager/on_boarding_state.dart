abstract class OnboardingState {
  const OnboardingState();
}

class OnboardingPageChanged extends OnboardingState {
  final int currentPage;

  const OnboardingPageChanged(this.currentPage);
}
