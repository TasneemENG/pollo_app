import 'package:flutter/material.dart';
import 'package:pollo/features/Home/presentation/views/widgets/my_adds/my_adds_body.dart';
class MyAds extends StatelessWidget {
  const MyAds({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyAddsBody(),
    );
  }
}
