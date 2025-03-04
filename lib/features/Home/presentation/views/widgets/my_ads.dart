import 'package:flutter/material.dart';
import 'package:pollo/core/widgets/app_bar.dart';
class MyAds extends StatelessWidget {
  const MyAds({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: "My Adds")
        ],
      ),
    );
  }
}
