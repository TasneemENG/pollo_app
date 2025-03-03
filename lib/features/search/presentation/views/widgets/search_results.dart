import 'package:flutter/material.dart';

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
            title: Text('Result ${index + 1} for $searchTerm'),
          );
        },
      ),
    );
  }
}
