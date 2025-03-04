import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<String> {
  SearchCubit() : super('');

  // Method to update the search term
  void updateSearchTerm(String searchTerm) {
    emit(searchTerm); // Emit the updated search term
  }
}
