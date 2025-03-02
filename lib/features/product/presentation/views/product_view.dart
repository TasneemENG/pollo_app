import 'package:flutter/material.dart';
import 'package:pollo/core/widgets/app_bar.dart';
import 'widgets/product_body.dart';
class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Pet Animals'),
      body: ProductBody(),
    );
  }
}
