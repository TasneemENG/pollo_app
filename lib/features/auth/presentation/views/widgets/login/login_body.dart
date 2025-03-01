import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/features/auth/presentation/views/widgets/login/login_header.dart';
import 'package:pollo/features/auth/presentation/views/widgets/login/login_social.dart';
import 'login_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LoginHeader(),
        20.verticalSpace,
        const LoginForm(),
        const LoginSocial(),
      ],
    );
  }
}
