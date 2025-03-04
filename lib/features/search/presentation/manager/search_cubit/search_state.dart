part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchUpdated extends SearchState {
  final String searchTerm;

  SearchUpdated(this.searchTerm);
}
