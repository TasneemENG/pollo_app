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
          Text("Country",style:TextStyles.settiing_texts),
          CustomDropdownWidget(
            name: 'Location',  // The name to be shown above the dropdown
            selectedValue:"",  // Current selected value
            onChanged: (newLocation) {
              setState(() {
                selectedItem= newLocation;  // Update the selected value
              });
            },
            options: ['New York', 'Los Angeles', 'Chicago', 'Miami'],  // List of dropdown options
          ),
          SizedBox(height:10.h),
          Text("Country",style:TextStyles.settiing_texts),
          CustomDropdownWidget(
            name: 'Language',  // The name to be shown above the dropdown
            selectedValue:"",  // Current selected value
            onChanged: (newLocation) {
              setState(() {
                selectedItem= newLocation;  // Update the selected value
              });
            },
            options: ['New York', 'Los Angeles', 'Chicago', 'Miami'],  // List of dropdown options
          ),
          SizedBox(height:10.h),
          Text("Theme Mode",style:TextStyles.settiing_texts),
          CustomDropdownWidget(
            name: 'Location',  // The name to be shown above the dropdown
            selectedValue:"",  // Current selected value
            onChanged: (newLocation) {
              setState(() {
                selectedItem= newLocation;  // Update the selected value
              });
            },
            options: ['New York', 'Los Angeles', 'Chicago', 'Miami'],  // List of dropdown options
          ),
        ],
      )
    );
  }
}
