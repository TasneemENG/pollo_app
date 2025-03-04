import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pollo/core/widgets/app_bar.dart'; // Import CustomAppBar
import 'package:pollo/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:pollo/features/search/presentation/views/widgets/search_history.dart';
import 'package:pollo/features/search/presentation/views/widgets/search_input_row.dart';
import 'package:pollo/features/search/presentation/views/widgets/search_results.dart';

class SearchPage extends StatelessWidget {
  final String searchTerm;

  const SearchPage({super.key, required this.searchTerm});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit()..updateSearchTerm(searchTerm), // Initialize the cubit with the initial searchTerm
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(title: "Search"),
            BlocBuilder<SearchCubit, String>(
              builder: (context, currentSearchTerm) {
                return SearchInputRow(
                  searchController: TextEditingController(text: currentSearchTerm),
                  onChanged: (newTerm) {

                    context.read<SearchCubit>().updateSearchTerm(newTerm);
                  },
                );
              },
            ),
            SizedBox(height: 16.h),
            const SearchHistory(),
            SizedBox(height: 16.h),
            BlocBuilder<SearchCubit, String>( // Now the state is just a String
              builder: (context, currentSearchTerm) {
                return SearchResults(searchTerm: currentSearchTerm);
              },
            ),
          ],
        ),
      ),
    );
  }
}
