import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/features/auth/presentation/views/widgets/auth_header.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        50.verticalSpace,
        const AuthHeader(
          title: 'Sign up',
          subtitle: 'Register with your valid email address',
        ),
      ],
    );
  }
}
