class CategoryItem {
  final String image;
  final String text;

  CategoryItem({required this.image, required this.text});
}

class Category {
  final String name;
  final List<CategoryItem> items;
  final List<Map<String, dynamic>> contentList;

  Category({required this.name, required this.items,this.contentList = const [],});
}
