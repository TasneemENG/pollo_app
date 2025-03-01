import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/features/auth/presentation/views/widgets/auth_header_image.dart';

import '../auth_header.dart';
class ForgetPasswordHeader extends StatelessWidget {
  const ForgetPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AuthHeaderImage(svgAssetPath: 'assets/svgs/gradientrectangle.svg',),
        20.verticalSpace,
        const AuthHeader(
          title: 'Forget Password?',
          isTitleGradient: false,
          subtitle: 'Don’t worry! it occurs. please enter the email address linked with your account.',
        ),
      ],
    );
  }
}
