import 'package:flutter/material.dart';
import 'package:pollo/features/profile/presentation/views/widgets/change_password/change_password_form.dart';
class ChangePasswordBody extends StatelessWidget {
  const ChangePasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          ChangePasswordForm(),
        ],
      ),
    );
  }
}
