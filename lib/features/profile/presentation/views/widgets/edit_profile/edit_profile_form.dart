import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/widgets/app_button.dart';
import 'package:pollo/core/widgets/app_text_form_field.dart';
import 'package:pollo/core/widgets/drop_down_widget.dart';

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
          labelStyle: TextStyles.font18Semibold,
          hintStyle:
              TextStyles.font16Medium.copyWith(color: AppColors.bodyText),
        ),
        SizedBox(height: 15.h),
        AppTextFormField(
          labelText: "Change Phone",
          hintText: "+201110101010",
          controller: phoneController,
          isPassword: false,
          isObscured: false,
          togglePasswordVisibility: () {},
          labelStyle: TextStyles.font18Semibold,
          hintStyle:
              TextStyles.font16Medium.copyWith(color: AppColors.bodyText),
        ),
        SizedBox(height: 15.h),
        CustomDropdownWidget(
          dropdownName: "Change Location",
          options: const ["Location 1", "Location 2", "Location 3"], onChanged: (value) {  },
        ),
        SizedBox(height: 30.h),
        AppButton(
          onPressed: () {},
          text: 'Save Changes',
          width: 246.w,
          height: 48.h,
          borderRadius: 30.r,
        ),
      ],
    );
  }
}
