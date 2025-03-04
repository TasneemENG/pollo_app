import 'package:flutter/material.dart';
import 'package:pollo/core/widgets/app_bar.dart';
class AddAdsView extends StatelessWidget {
  const AddAdsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Add Ads"),

    );
  }
}
