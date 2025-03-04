import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pollo/core/widgets/app_text_form_field.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({super.key});

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          labelText: "Change Name",
          hintText: "Salma Ibrahim",
          controller: nameController,
          isPassword: false,
          isObscured: false,
          togglePasswordVisibility: () {},
        ),
        SizedBox(height: 15.h),
        AppTextFormField(
          labelText: "Change Phone",
          hintText: "+201110101010",
          controller: phoneController,
          isPassword: false,
          isObscured: false,
          togglePasswordVisibility: () {},
          suffixIcon: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/svgs/phone.svg"),
          ),
        ),
      ],
    );
  }
}