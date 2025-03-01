import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/features/auth/presentation/views/widgets/forget_password/forget_password_form.dart';
import 'package:pollo/features/auth/presentation/views/widgets/forget_password/forget_password_header.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const ForgetPasswordHeader(),
      20.verticalSpace,
      const ForgetPasswordForm(),
    ]);
  }
}
