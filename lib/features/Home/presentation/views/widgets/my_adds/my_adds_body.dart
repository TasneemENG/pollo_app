import 'package:flutter/material.dart';
import 'package:pollo/core/widgets/app_bar.dart';
class MyAddsBody extends StatelessWidget {
  const MyAddsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(title: "My Adds")
      ],
    );
  }
}
