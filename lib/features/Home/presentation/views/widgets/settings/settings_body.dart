import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/widgets/app_bar.dart';
import 'package:pollo/core/widgets/drop_down_widget.dart';
class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: "Settings",),
        SizedBox(height: 20.h,),
        CustomDropdownWidget(
          options: ['New York', 'Los Angeles', 'Chicago', 'Miami'], dropdownName: 'Country', onChanged: (value) {  },
        ),
        SizedBox(height:20.h),
        CustomDropdownWidget(
          options: ['English', 'Spanish', 'French', 'German', 'Chinese'], dropdownName: 'Language', onChanged: (value) {  },
        ),
        SizedBox(height:20.h),
        CustomDropdownWidget(
          options: ['Light', 'Dark', 'System Default'], dropdownName: 'Theme Mode', onChanged: (value) {  },
        ),
      ],
    );
  }
}
