import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:pollo/features/auth/presentation/views/widgets/auth_header_image.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AuthHeaderImage(svgAssetPath: 'assets/svgs/gradientrectangle.svg',),
       10.verticalSpace,
        const AuthHeader(
          title: 'Sign in',
          subtitle: 'Sign in to Resgister Account',
        ),
      ],
    );
  }
}
