import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/helpers/extensions.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
import 'package:pollo/core/routing/routes.dart';
class ForgetActionButton extends StatelessWidget {
  const ForgetActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              context.pushNamed(Routes.forgotPasswordView);
            },
            child:ShaderMask(
              shaderCallback: (bounds) => AppColors.mainColor.createShader(bounds),
              child: Text(
                "Forget Password?",
                style: TextStyles.font14Solid.copyWith(
                  color: AppColors.background,
                ),
              ),
            ),
          ),
        ]
      ),
    );
  }
}
