import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/features/profile/presentation/views/widgets/edit_profile/edit_profile_form.dart';
import 'package:pollo/features/profile/presentation/views/widgets/edit_profile/edit_profile_header.dart';
class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const EditProfileHeader(),
          SizedBox(height: 20.h),
          const EditProfileForm(),
        ],)
    );
  }
}
