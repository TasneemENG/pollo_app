import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/helpers/app_cubit.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';

class SortByDropdown extends StatelessWidget {
  const SortByDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> options = [
      "Recent",
      "Low price",
      "Nearest",
      "High price"
    ];

    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        String? selectedOption;
        if (state is AppSortingOptionChanged) {
          selectedOption = state.selectedOption;
        }

        return Container(
          height: 30.h,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(30.r),
            border: Border.all(color: AppColors.borderColor, width: 0.5.w),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: null,
              hint: Text("Sort By", style: TextStyles.font12Medium),
              onChanged: (String? newValue) {
                context.read<AppCubit>().updateSortingOption(newValue);
              },
              icon: ShaderMask(
                shaderCallback: (bounds) =>
                    AppColors.mainColor.createShader(bounds),
                child: Icon(
                  Icons.keyboard_arrow_down,
                  size: 22.w,
                  color: AppColors.background,
                ),
              ),
              dropdownColor: AppColors.background,
              borderRadius: BorderRadius.circular(12.r),
              items: options.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(option, style: TextStyles.font12Medium),
                      if (selectedOption == option)
                        ShaderMask(
                          shaderCallback: (bounds) =>
                              AppColors.mainColor.createShader(bounds),
                          child: Icon(
                            Icons.check,
                            size: 18.w,
                            color: AppColors.background,
                          ),
                        ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
