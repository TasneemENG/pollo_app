import 'package:flutter/material.dart';
import 'saved_item_widget.dart';

class SavedItemsList extends StatelessWidget {
  final List<Map<String, String>> savedItems;
  final Function(int) onDelete;

  const SavedItemsList({super.key, required this.savedItems, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(savedItems.length, (index) {
        final item = savedItems[index];
        return SavedItemWidget(
          title: item['title']!,
          category: item['category']!,
          iconPath: 'assets/svgs/delete.svg',
          onDelete: () => onDelete(index),
        );
      }),
    );
  }
}
