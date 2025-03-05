import 'package:flutter/material.dart';
import 'package:pollo/features/add_ads/presentation/views/widgets/add_ads_form.dart';
class AddAdsBody extends StatelessWidget {
  const AddAdsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          AddAdsForm()
        ],
      ),
    );
  }
}
