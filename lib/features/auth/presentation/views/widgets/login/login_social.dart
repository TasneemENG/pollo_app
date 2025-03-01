import 'package:flutter/material.dart';
import 'package:pollo/features/auth/presentation/views/widgets/auth_social_section.dart';

class LoginSocial extends StatelessWidget {
  const LoginSocial({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthSocialSection(
      title: 'Sign in with',
      onGooglePressed: () {},
      onFacebookPressed: () {},
    );
  }
}
