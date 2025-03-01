import 'package:flutter/material.dart';
import 'package:pollo/features/auth/presentation/views/widgets/verification/verification_header.dart';

import 'verification_pin_put.dart';
class VerificationBody extends StatelessWidget {
  const VerificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerificationHeader(),
        VerificationPinPut()
      ],
    );
  }
}
