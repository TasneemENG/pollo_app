import 'package:flutter/material.dart';
import 'package:pollo/core/widgets/app_bar.dart';

import 'widgets/help_and_support/help_and_support_body.dart';
class HelpAndSupportView extends StatelessWidget {
  const HelpAndSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Help & Support"),
      body: HelpAndSupportBody(),
    );
  }
}
