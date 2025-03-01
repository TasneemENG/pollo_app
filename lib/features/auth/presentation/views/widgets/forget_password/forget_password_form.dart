import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pollo/core/helpers/extensions.dart';
import 'package:pollo/core/routing/routes.dart';
import 'package:pollo/core/widgets/app_button.dart';
import 'package:pollo/core/widgets/app_text_form_field.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({super.key});

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AppTextFormField(
        labelText: "Email",
        hintText: "Enter Your Email",
        controller: emailController,
        isPassword: false,
        isObscured: false,
        togglePasswordVisibility: () {},
        suffixIcon: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/svgs/email.svg"),
        ),
      ),
      30.verticalSpace,
      AppButton(
        onPressed: () {context.pushNamed(Routes.verificationView);},
        text: 'Send Code',
        width: 246.w,
        height: 48.h,
        borderRadius: 30.r,
      ),
    ]);
  }
}
