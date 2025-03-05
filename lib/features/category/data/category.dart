import 'package:pollo/features/Home/data/category_item.dart';

class Category {
  final String name;
  final List<CategoryItem> items;

  Category({
    required this.name,
    required this.items,
  });
}