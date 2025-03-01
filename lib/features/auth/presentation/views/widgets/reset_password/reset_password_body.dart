import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'reset_password_form.dart';
import 'reset_password_header.dart';
class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ResetPasswordHeader(),
          30.verticalSpace,
          const ResetPasswordForm(),
      
        ],
      ),
    );
  }
}
