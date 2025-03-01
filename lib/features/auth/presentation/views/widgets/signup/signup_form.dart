import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pollo/core/helpers/extensions.dart';
import 'package:pollo/core/routing/routes.dart';
import 'package:pollo/core/widgets/app_button.dart';
import 'package:pollo/core/widgets/app_text_form_field.dart';
import 'package:pollo/features/auth/presentation/views/widgets/auth_action_text.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
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
      children: [
        // Name Field
        AppTextFormField(
          labelText: "Name",
          hintText: "Enter Your Name",
          controller: nameController,
          isPassword: false,
          isObscured: false,
          togglePasswordVisibility: () {},
          suffixIcon: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/svgs/person.svg"), // Add a user icon
          ),
        ),
        15.verticalSpace,

        // Email Field
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

        // Phone Field
        AppTextFormField(
          labelText: "Phone",
          hintText: "Enter Your Phone Number",
          controller: phoneController,
          isPassword: false,
          isObscured: false,
          togglePasswordVisibility: () {},
          suffixIcon: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/svgs/phone.svg"), // Add a phone icon
          ),
        ),
        15.verticalSpace,

        // Password Field
        AppTextFormField(
          labelText: "Password",
          hintText: "Enter Your Password",
          controller: passwordController,
          isPassword: true,
          isObscured: isObscureText,
          togglePasswordVisibility: togglePasswordVisibility,
        ),
        15.verticalSpace,

        // Confirm Password Field
        AppTextFormField(
          labelText: "Confirm Password",
          hintText: "Confirm Your Password",
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
          text: 'Sign Up',
          width: 246.w,
          height: 48.h,
          borderRadius: 30.r,
        ),
        AuthActionText(
          initialText: 'Already have an account?',
          actionText: 'Sign In',
          onActionTap: () {
            context.pushNamed(Routes.loginView); // Navigate to the login screen
          },
        ),
      ],
    );
  }
}
