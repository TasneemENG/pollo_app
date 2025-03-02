import 'package:flutter/material.dart';

import 'product_header.dart';
import 'product_item.dart';
import 'product_item_list.dart';
import 'product_search_bar.dart';
class ProductBody extends StatelessWidget {
  const ProductBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductHeader(),
          ProductItemList(),
        ],
      ),
    );
  }
}
