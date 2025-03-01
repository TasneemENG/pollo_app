// onboarding_model.dart

import '../../../../core/resources/app_images.dart';

class OnboardingModel {
  final String title;
  final String subtitle;
  final String image;

  OnboardingModel({
    required this.title,
    required this.subtitle,
    required this.image,
  });
}

// Sample onboarding data
final List<OnboardingModel> onboardingData = [
  OnboardingModel(
    title: "Welcome To",
    subtitle: "Pollo Store! The perfect place to purchase veterinary products easily and safely",
    image: Assets.onboarding1,
  ),
  OnboardingModel(
    title: "All-in-One Veterinary Solution!",
    subtitle: "Manage poultry, livestock, fish, and pets effortlessly with a complete farm management solution at your fingertips",
    image: Assets.onboarding2,
  ),
  OnboardingModel(
    title: "Expert Advice & Veterinary Support!",
    subtitle: "Connect with expert veterinarians for quick guidance to care for your animals and resolve health issues efficiently",
    image: Assets.onboarding3,
  ),
];
