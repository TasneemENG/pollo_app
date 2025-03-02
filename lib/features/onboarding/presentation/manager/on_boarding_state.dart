abstract class OnboardingState {
  const OnboardingState();

  int get currentPage;
}

class OnboardingInitial extends OnboardingState {
  const OnboardingInitial();

  @override
  int get currentPage => 0;
}

class OnboardingPageChanged extends OnboardingState {
  @override
  final int currentPage;

  const OnboardingPageChanged(this.currentPage);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OnboardingPageChanged && other.currentPage == currentPage;
  }

  @override
  int get hashCode => currentPage.hashCode;
}
