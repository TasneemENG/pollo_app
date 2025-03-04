import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/widgets/app_bar.dart';
import 'package:pollo/core/widgets/drop_down_widget.dart';
class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String? selectedItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          CustomAppBar(title: "Settings",),
          SizedBox(height: 20.h,),
          CustomDropdownWidget(
            options: ['New York', 'Los Angeles', 'Chicago', 'Miami'], dropdownName: 'Country',
          ),
          SizedBox(height:20.h),
          CustomDropdownWidget(
            options: ['English', 'Spanish', 'French', 'German', 'Chinese'], dropdownName: 'Language',
          ),
          SizedBox(height:20.h),
          CustomDropdownWidget(
            options: ['Light', 'Dark', 'System Default'], dropdownName: 'Theme Mode',
          ),
        ],
      )
    );
  }
}
