import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCubit extends Cubit<List<Map<String, String>>> {
  FavoriteCubit() : super([]);

  void toggleFavorite(Map<String, String> product) {
    final currentFavorites = List<Map<String, String>>.from(state);
    if (currentFavorites.any((fav) => fav['name'] == product['name'])) {
      currentFavorites.removeWhere((fav) => fav['name'] == product['name']);
    } else {
      currentFavorites.add(product);
    }
    emit(currentFavorites);
  }
}
