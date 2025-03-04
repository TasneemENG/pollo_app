import 'package:flutter/material.dart';
import 'package:pollo/features/Home/presentation/views/widgets/_home/home_body.dart' show HomeBody;
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeBody(),
    );
  }
}
