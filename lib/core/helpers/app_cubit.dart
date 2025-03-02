import 'package:flutter_bloc/flutter_bloc.dart';

/// AppCubit manages global app state, including navigation and sorting.
class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  int _currentIndex = 0; // Holds the current bottom navigation index.

  /// Method to update the loading state.
  void updateLoadingState(bool isLoading) {
    emit(AppLoadingState(isLoading: isLoading));
  }

  /// Method to update the user authentication state.
  void updateAuthState(bool isLoggedIn) {
    emit(AppAuthStateChanged(isLoggedIn: isLoggedIn));
  }

  /// Method to update the app connectivity state.
  void updateConnectivityState(bool isConnected) {
    emit(AppConnectivityStateChanged(isConnected: isConnected));
  }

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
}

/// Base state for the AppCubit.
abstract class AppState {}

/// Initial state of the app.
class AppInitial extends AppState {}

/// State when the app is loading.
class AppLoadingState extends AppState {
  final bool isLoading;
  AppLoadingState({required this.isLoading});
}

/// State when the user authentication state changes.
class AppAuthStateChanged extends AppState {
  final bool isLoggedIn;
  AppAuthStateChanged({required this.isLoggedIn});
}

/// State when the app connectivity state changes.
class AppConnectivityStateChanged extends AppState {
  final bool isConnected;
  AppConnectivityStateChanged({required this.isConnected});
}

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
