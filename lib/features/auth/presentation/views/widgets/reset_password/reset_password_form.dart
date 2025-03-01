import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/widgets/app_button.dart';
import 'package:pollo/core/widgets/app_text_form_field.dart';
class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();
  bool isObscureText = true;
  bool isConfirmPasswordObscure = true;

  void togglePasswordVisibility() {
    setState(() {
      isObscureText = !isObscureText;
    });
  }

  void toggleConfirmPasswordVisibility() {
    setState(() {
      isConfirmPasswordObscure = !isConfirmPasswordObscure;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppTextFormField(
          labelText: "New Password",
          hintText: "Password",
          controller: passwordController,
          isPassword: true,
          isObscured: isObscureText,
          togglePasswordVisibility: togglePasswordVisibility,
        ),
        15.verticalSpace,

        // Confirm Password Field
        AppTextFormField(
          labelText: "Confirm Password",
          hintText: "Confirm Password",
          controller: confirmPasswordController,
          isPassword: true,
          isObscured: isConfirmPasswordObscure,
          togglePasswordVisibility: toggleConfirmPasswordVisibility,
        ),
        20.verticalSpace,

        // Sign Up Button
        AppButton(
          onPressed: () {
            // Handle sign-up logic here
          },
          text: 'Continue',
          width: 246.w,
          height: 48.h,
          borderRadius: 30.r,
        ),
      ]
    );
  }
}
