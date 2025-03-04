import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  // Method to update the search term
  void updateSearchTerm(String searchTerm) {
    emit(SearchUpdated(searchTerm));
  }
}
