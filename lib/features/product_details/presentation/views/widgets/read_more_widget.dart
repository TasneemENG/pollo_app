import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/helpers/app_cubit.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/widgets/app_gredient_text.dart';

class ReadMoreWidget extends StatelessWidget {
  final String text;
  const ReadMoreWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final cubit = context.read<AppCubit>();
        bool isExpanded = cubit.isDescriptionExpanded;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              maxLines: isExpanded ? null : 2,
              overflow:
                  isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
              style: TextStyles.font16Medium.copyWith(
                color: AppColors.bodyText,
              ),
            ),
            GestureDetector(
              onTap: cubit.toggleDescription,
              child: Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Row(
                  children: [
                    GradientText(
                      text: isExpanded ? ' Read less' : ' Read more',
                      style: TextStyles.font12Bold,
                    ),
                    Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      size: 15.w,
                      color: AppColors.mainColor.colors.last,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
