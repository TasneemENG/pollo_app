import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:pollo/features/auth/presentation/views/widgets/auth_header_image.dart';
class VerificationHeader extends StatelessWidget {
  const VerificationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AuthHeaderImage(svgAssetPath: 'assets/svgs/gradientrectangle.svg',),
        20.verticalSpace,
        const AuthHeader(
          title: 'Get Your Code',
          isTitleGradient: false,
          subtitle: 'Please enter the 4 digit code that send to your email address',
        ),
      ],
    );
  }
}