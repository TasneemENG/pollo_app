import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:pollo/features/auth/presentation/views/widgets/auth_header_image.dart';
class ResetPasswordHeader extends StatelessWidget {
  const ResetPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AuthHeaderImage(svgAssetPath: 'assets/svgs/gradientrectangle.svg',showPopButton: true),
        20.verticalSpace,
        const AuthHeader(
          title: 'Reset Password',
          isTitleGradient: false,
          subtitle: 'Your new password must be different from previously used password',
        ),
      ],
    );
  }
}