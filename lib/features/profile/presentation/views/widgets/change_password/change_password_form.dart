import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/widgets/app_text_form_field.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool isCurrentPasswordObscured = true;
  bool isNewPasswordObscured = true;
  bool isConfirmPasswordObscured = true;

  void toggleCurrentPasswordVisibility() {
    setState(() {
      isCurrentPasswordObscured = !isCurrentPasswordObscured;
    });
  }

  void toggleNewPasswordVisibility() {
    setState(() {
      isNewPasswordObscured = !isNewPasswordObscured;
    });
  }

  void toggleConfirmPasswordVisibility() {
    setState(() {
      isConfirmPasswordObscured = !isConfirmPasswordObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppTextFormField(
            labelText: "Current Password",
            hintText: "Enter Current Password",
            controller: currentPasswordController,
            isPassword: true,
            isObscured: isCurrentPasswordObscured,
            togglePasswordVisibility: toggleCurrentPasswordVisibility,
          ),
          15.verticalSpace,
          AppTextFormField(
            labelText: "New Password",
            hintText: "Enter New Password",
            controller: newPasswordController,
            isPassword: true,
            isObscured: isNewPasswordObscured,
            togglePasswordVisibility: toggleNewPasswordVisibility,
          ),
          15.verticalSpace,
          AppTextFormField(
            labelText: "Confirm Password",
            hintText: "Confirm Your Password",
            controller: confirmPasswordController,
            isPassword: true,
            isObscured: isConfirmPasswordObscured,
            togglePasswordVisibility: toggleConfirmPasswordVisibility,
          ),
          20.verticalSpace,
        ],
      ),
    );
  }
}