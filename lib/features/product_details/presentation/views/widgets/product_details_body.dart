import 'package:flutter/material.dart';
import 'package:pollo/features/product/presentation/views/widgets/product_header.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductHeader(),
        ],
      ),
    );
  }
}
