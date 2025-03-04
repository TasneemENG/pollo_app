import 'package:flutter_bloc/flutter_bloc.dart';

/// AppCubit manages global app state, including navigation and sorting.
class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  int _currentIndex = 0; // Holds the current bottom navigation index.


  /// Method to update the selected sorting option.
  void updateSortingOption(String? selectedOption) {
    emit(AppSortingOptionChanged(selectedOption: selectedOption));
  }

  /// Method to update the container index.
  void updateContainerIndex(int index) {
    emit(AppContainerIndexChanged(index: index));
  }

  /// Method to update the bottom navigation index.
  void updateBottomNavIndex(int index) {
    if (_currentIndex != index) {
      _currentIndex = index;
      emit(BottomNavUpdated(index: index));
    }
  }

  /// Getter for the current bottom navigation index.
  int get currentIndex => _currentIndex;

  bool isDescriptionExpanded = false;

  void toggleDescription() {
    isDescriptionExpanded = !isDescriptionExpanded;
    emit(AppDescriptionToggled());
  }

  final Map<String, bool> _dropdownExpandedStates = {};
  final Map<String, String?> _selectedValues = {};

  // Getter to check if a dropdown is expanded
  bool isDropdownExpanded(String dropdownName) {
    return _dropdownExpandedStates[dropdownName] ?? false;
  }

  // Method to toggle the expanded state of a dropdown
  void toggleDropdownExpanded(String dropdownName) {
    _dropdownExpandedStates[dropdownName] =
        !(_dropdownExpandedStates[dropdownName] ?? false);
    emit(DropdownExpandedState(dropdownName));
  }

  // Getter to retrieve the selected value for a specific dropdown
  String? getSelectedValue(String dropdownName) {
    return _selectedValues[dropdownName];
  }

  // Method to update the selected value for a specific dropdown
  void updateSelectedValue(String dropdownName, String? newValue) {
    _selectedValues[dropdownName] = newValue;
    emit(DropdownUpdatedState(dropdownName));
  }

  final Map<String, bool> _checkboxStates = {};

  // Getter to retrieve the checkbox state
  bool isCheckboxChecked(String checkboxName) {
    return _checkboxStates[checkboxName] ?? false;
  }

  // Method to toggle the checkbox state
  void toggleCheckbox(String checkboxName) {
    _checkboxStates[checkboxName] = !(_checkboxStates[checkboxName] ?? false);
    emit(CheckboxStateUpdated(checkboxName));
  }
}

/// Base state for the AppCubit.
abstract class AppState {}

/// Initial state of the app.
class AppInitial extends AppState {}


/// State when the selected sorting option changes.
class AppSortingOptionChanged extends AppState {
  final String? selectedOption;
  AppSortingOptionChanged({required this.selectedOption});
}

/// State when the container index changes.
class AppContainerIndexChanged extends AppState {
  final int index;
  AppContainerIndexChanged({required this.index});
}

/// State when the bottom navigation index changes.
class BottomNavUpdated extends AppState {
  final int index;
  BottomNavUpdated({required this.index});
}

class AppDescriptionToggled extends AppState {}

// New state for dropdown expanded/collapsed
class DropdownExpandedState extends AppState {
  final String dropdownName;
  DropdownExpandedState(this.dropdownName);
}

// Existing state for dropdown value updates
class DropdownUpdatedState extends AppState {
  final String dropdownName;

  DropdownUpdatedState(this.dropdownName);
}

class CheckboxStateUpdated extends AppState {
  final String checkboxName;
  CheckboxStateUpdated(this.checkboxName);
}
