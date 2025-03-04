import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/helpers/app_cubit.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';

class AppCheckbox extends StatelessWidget {
  final String checkboxName;
  final String label;

  const AppCheckbox({
    super.key,
    required this.checkboxName,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final appCubit = context.read<AppCubit>();
        final isChecked = appCubit.isCheckboxChecked(checkboxName);

        return GestureDetector(
          onTap: () {
            appCubit.toggleCheckbox(checkboxName);
          },
          child: Row(
            children: [
              Container(
                width: 18.w,
                height: 18.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.r),
                    gradient: AppColors.mainColor),
                child: Container(
                  margin: EdgeInsets.all(1.w), // Border width
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: AppColors.background,
                  ),
                  child: isChecked
                      ? Center(
                          child: ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return AppColors.mainColor.createShader(bounds);
                            },
                            child: Icon(
                              Icons.check,
                              size: 16.sp,
                              color: AppColors
                                  .background, // Icon color (will be masked)
                            ),
                          ),
                        )
                      : null,
                ),
              ),
              8.horizontalSpace,

              // Label
              Text(
                label,
                style:
                    TextStyles.font14Medium.copyWith(color: AppColors.mainText),
              ),
            ],
          ),
        );
      },
    );
  }
}
