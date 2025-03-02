import 'package:flutter/material.dart';
import 'product_header.dart';
import 'product_list.dart';

class ProductBody extends StatelessWidget {
  const ProductBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ProductHeader(),
          ProductList(),
        ],
      ),
    );
  }
}