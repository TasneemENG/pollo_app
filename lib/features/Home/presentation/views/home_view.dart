import 'package:flutter/material.dart';
import 'package:pollo/features/Home/presentation/views/widgets/home_body.dart';
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeBody(),
    );
  }
}
