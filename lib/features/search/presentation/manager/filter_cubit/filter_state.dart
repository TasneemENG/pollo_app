import 'package:flutter/material.dart';

class FilterState {
  final RangeValues priceRange;
  final String? selectedLocation;

  FilterState({
    this.priceRange = const RangeValues(0, 1000),
    this.selectedLocation,
  });

  // Method to copy the state with new values
  FilterState copyWith({RangeValues? priceRange, String? selectedLocation}) {
    return FilterState(
      priceRange: priceRange ?? this.priceRange,
      selectedLocation: selectedLocation ?? this.selectedLocation,
    );
  }
}
