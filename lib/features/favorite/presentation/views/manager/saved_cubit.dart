import 'package:flutter_bloc/flutter_bloc.dart';

class SavedCubit extends Cubit<List<Map<String, String>>> {
  SavedCubit() : super([]);

  void addSavedItem(Map<String, String> item) {
    final updatedList = List<Map<String, String>>.from(state);
    if (!updatedList.any((saved) => saved['title'] == item['title'])) {
      updatedList.add(item);
      emit(updatedList);
    }
  }

  void removeSavedItem(int index) {
    final updatedList = List<Map<String, String>>.from(state);
    if (index >= 0 && index < updatedList.length) {
      updatedList.removeAt(index);
      emit(updatedList);
    }
  }

  void clearSavedItems() {
    emit([]);
  }
}
