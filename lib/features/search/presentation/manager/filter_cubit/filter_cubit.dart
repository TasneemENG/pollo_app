import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterCubit extends Cubit<Map<String, dynamic>> {
  FilterCubit()
      : super({
    'priceRange': const RangeValues(0, 1000),
    'selectedLocation': null,
  });

  // Update price range
  void updatePriceRange(RangeValues range) {
    emit({
      'priceRange': range,
      'selectedLocation': state['selectedLocation'],
    });
  }

  // Update location
  void updateLocation(String? location) {
    emit({
      'priceRange': state['priceRange'],
      'selectedLocation': location,
    });
  }
}
