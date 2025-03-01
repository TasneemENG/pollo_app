import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/helpers/extensions.dart';
import 'package:pollo/core/routing/routes.dart';
import 'package:pollo/core/widgets/app_button.dart';
import 'package:pollo/features/auth/presentation/views/widgets/auth_action_text.dart';
import 'verification_pin_put.dart';

class VerificationForm extends StatelessWidget {
  const VerificationForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const VerificationPinPut(),
          20.verticalSpace,
          AppButton(
            onPressed: () {
             context.pushNamed(Routes.resetPasswordView);
            },
            text: 'Verify',
            width: 246.w,
            height: 48.h,
            borderRadius: 30.r,
          ),
          AuthActionText(
              initialText: 'Didn’t received code?',
              actionText: 'Resend',
              onActionTap: () {})
        ],
      ),
    );
  }
}
