import 'package:bloc/bloc.dart';

class SearchCubit extends Cubit<String> {
  SearchCubit() : super(''); // Initially set to an empty string or a default value.

  // Method to update the search term
  void updateSearchTerm(String searchTerm) {
    emit(searchTerm); // Directly emit the new search term
  }
}
