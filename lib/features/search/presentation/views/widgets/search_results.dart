import 'package:flutter/material.dart';
import 'package:pollo/core/resources/app_colors.dart';

class SearchResults extends StatelessWidget {
  final String searchTerm;

  const SearchResults({super.key, required this.searchTerm});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 3, // This should be dynamic based on your data
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Result ${index + 1} for $searchTerm'),
                Icon(Icons.south_east_sharp,color: AppColors.iconColor,)
              ],
            ),
          );
        },
      ),
    );
  }
}
