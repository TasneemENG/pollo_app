import 'package:flutter/material.dart';
import 'package:pollo/core/widgets/app_bar.dart';
import 'package:pollo/features/profile/presentation/views/widgets/change_password/change_password_body.dart';
class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Change Password',),
      body: ChangePasswordBody(),
    );
  }
}
