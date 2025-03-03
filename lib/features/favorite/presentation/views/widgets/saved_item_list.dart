import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/features/favorite/presentation/views/widgets/saved_item_widget.dart';

class SavedItemsList extends StatelessWidget {
  final List<Map<String, String>> savedItems;
  final Function(int index) onDelete;

  const SavedItemsList({
    super.key,
    required this.savedItems,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: savedItems.length,
          itemBuilder: (context, index) {
            final item = savedItems[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.r),
              child: SavedItemWidget(
                title: item['title']!,
                category: item['category']!,
                iconPath: "assets/svgs/trash-2.svg",
                onDelete: () {
                  //TODO DELETE LOGIC
                  onDelete(index);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
