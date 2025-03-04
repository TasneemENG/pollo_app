import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo/features/search/presentation/manager/filter_cubit/filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterState());

  // Update price range
  void updatePriceRange(RangeValues range) {
    emit(state.copyWith(priceRange: range));
  }

  // Update location
  void updateLocation(String? location) {
    emit(state.copyWith(selectedLocation: location));
  }
}

