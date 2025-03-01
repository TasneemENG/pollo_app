import 'package:flutter/material.dart';
import 'package:pollo/core/resources/app_colors.dart';
import 'package:pollo/core/resources/app_text_styles.dart';
class LoginActionButton extends StatelessWidget {
  const LoginActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              // context.pushNamed(Routes.forgotPasswordView);
            },
            child:ShaderMask(
              shaderCallback: (bounds) => AppColors.mainColor.createShader(bounds),
              child: Text(
                "Forget Password?",
                style: TextStyles.font14Solid.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ]
      ),
    );
  }
}
