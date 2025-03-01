import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'signup_form.dart';
import 'signup_header.dart';
import 'signup_social.dart';
class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SignupHeader(),
          20.verticalSpace,
          const SignupForm(),
          const SignupSocial(),
        ]
      ),
    );
  }
}
