import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pollo/core/helpers/extensions.dart';
import 'package:pollo/core/routing/routes.dart';
import 'package:pollo/core/widgets/app_button.dart';
import 'package:pollo/core/widgets/app_text_form_field.dart';
import 'package:pollo/features/auth/presentation/views/widgets/auth_action_text.dart';
import 'package:pollo/features/auth/presentation/views/widgets/login/login_action_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isObscureText = true;

  void togglePasswordVisibility() {
    setState(() {
      isObscureText = !isObscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        15.verticalSpace,
        AppTextFormField(
          labelText: "Password",
          hintText: "Enter Your Password",
          controller: passwordController,
          isPassword: true,
          isObscured: isObscureText,
          togglePasswordVisibility: togglePasswordVisibility,
        ),
        const LoginActionButton(),
        AppButton(
          onPressed: () {},
          text: 'Sign In',
          width: 246.w,
          height: 48.h,
          borderRadius: 30.r,
        ),
        AuthActionText(
          initialText: 'Don’t have an account?',
          actionText: 'Sign Up',
          onActionTap: () {context.pushNamed(Routes.signUpView);},
        ),
      ],
    );
  }
}