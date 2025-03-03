import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/widgets/app_bar.dart'; // Import CustomAppBar
// Import AppSearchBar
import 'package:pollo/features/search/presentation/views/widgets/search_history.dart';
import 'package:pollo/features/search/presentation/views/widgets/search_input_row.dart';
import 'package:pollo/features/search/presentation/views/widgets/search_results.dart';


class SearchPage extends StatefulWidget {
  final String searchTerm;

  const SearchPage({super.key, required this.searchTerm});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _searchController;
  late String _currentSearchTerm;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.searchTerm);
    _currentSearchTerm = widget.searchTerm;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(title: "Search"),
          SearchInputRow(
            searchController: _searchController,
            onChanged: (newTerm) {
              setState(() {
                _currentSearchTerm = newTerm;
              });
            },
          ),
          SizedBox(height: 16.h),
          const SearchHistory(),
          SizedBox(height: 16.h),
          SearchResults(searchTerm: _currentSearchTerm),
        ],
      ),
    );
  }
}
