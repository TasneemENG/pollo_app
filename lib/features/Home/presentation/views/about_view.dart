import 'package:flutter/material.dart';
import 'package:pollo/features/Home/presentation/views/widgets/about/about_body.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AboutBody()
    );
  }
}