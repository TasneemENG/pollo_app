import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/resources/app_colors.dart';

class AuthActionText extends StatelessWidget {
  final String initialText;
  final String actionText;
  final VoidCallback onActionTap;

  const AuthActionText({
    super.key,
    required this.initialText,
    required this.actionText,
    required this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              style: TextStyles.font14Medium.copyWith(color: AppColors.bodyText),
              children: [
                TextSpan(text: initialText),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: onActionTap,
                    child: ShaderMask(
                      shaderCallback: (bounds) => AppColors.mainColor.createShader(bounds),
                      child: Text(
                        " $actionText",
                        style: TextStyles.font16Solid.copyWith(color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
