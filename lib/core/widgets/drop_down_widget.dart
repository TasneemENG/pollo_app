import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/helpers/app_cubit.dart'; // Ensure AppCubit is properly defined and imported
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';

class CustomDropdownWidget extends StatelessWidget {
  final String dropdownName;
  final List<String> options;

  const CustomDropdownWidget({
    super.key,
    required this.dropdownName,
    required this.options, String? selectedValue, required Null Function(dynamic value) onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      buildWhen: (previous, current) {
        return current is DropdownExpandedState &&
            current.dropdownName == dropdownName ||
            current is DropdownUpdatedState &&
                current.dropdownName == dropdownName;
      },
      builder: (context, state) {
        final appCubit = context.read<AppCubit>();
        final isExpanded = appCubit.isDropdownExpanded(dropdownName);
        final selectedValue = appCubit.getSelectedValue(dropdownName);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Label for the dropdown
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Text(
                dropdownName,
                style: TextStyles.font18Semibold,
              ),
            ),
            8.verticalSpace, // Spacing between label and dropdown

            // Dropdown header and options
            GestureDetector(
              onTap: () {
                // Toggle the expanded state of the dropdown
                appCubit.toggleDropdownExpanded(dropdownName);
              },
              child: Stack(
                children: [
                  // Gradient border container
                  Container(
                    width: 343.w,
                    height: isExpanded ? 200.h : 51.h,
                    // Adjust size based on expanded state
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      gradient: AppColors.mainColor, // Gradient background
                    ),
                  ),

                  // White inner container
                  Padding(
                    padding: EdgeInsets.all(1.w), // Adjust for border width
                    child: Container(
                      width: 341.w,
                      height: isExpanded ? 198.h : 49.h,
                      // Adjust for border width
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          // Dropdown header (selected value or hint)
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 12.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  selectedValue ?? "Choose",
                                  // Display selected value or hint
                                  style: selectedValue != null
                                      ? TextStyles.filterTexts
                                      : TextStyles
                                      .choose, // Apply different text style based on selection
                                ),
                                RotationTransition(
                                  turns: isExpanded
                                      ? const AlwaysStoppedAnimation(0.5)
                                      : const AlwaysStoppedAnimation(0),
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: AppColors.iconColor,
                                    size: 24.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Expanded options list
                          if (isExpanded) ...[
                            Divider(
                              height: 1.h,
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: options.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      appCubit.updateSelectedValue(
                                          dropdownName, options[index]);
                                      appCubit.toggleDropdownExpanded(
                                          dropdownName);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.w, vertical: 12.h),
                                      child: Text(
                                        options[index],
                                        style: TextStyles.filterTexts,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}