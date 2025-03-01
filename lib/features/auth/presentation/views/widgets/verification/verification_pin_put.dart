import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:pollo/core/resources/app_colors.dart';

class VerificationPinPut extends StatelessWidget {
  final int pinLength;
  final void Function(String)? onCompleted;
  final TextEditingController? controller;

  const VerificationPinPut({
    super.key,
    this.pinLength = 4,
    this.onCompleted,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.shade400, // Default gray border
          width: 1.5,
        ),
        color: Colors.white,
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white, // Inner white box
        boxShadow: [
          BoxShadow(
            color: AppColors.mainColor.colors.first.withOpacity(0.6),
            spreadRadius: 2,
            blurRadius: 4,
          ),
        ],
      ),
    );

    return Pinput(
      length: pinLength,
      controller: controller,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: focusedPinTheme,
      onCompleted: onCompleted,
    );
  }
}
