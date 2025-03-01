import 'package:flutter/material.dart';
import 'package:pollo/features/auth/presentation/views/widgets/auth_social_section.dart';

class SignupSocial extends StatelessWidget {
  const SignupSocial({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthSocialSection(
      title: 'Sign up with',
      onGooglePressed: () {},
      onFacebookPressed: () {},
    );
  }
}
