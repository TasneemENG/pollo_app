import 'package:flutter_bloc/flutter_bloc.dart';

/// AppCubit manages global app state.
class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  /// Method to update the loading state.
  void updateLoadingState(bool isLoading) {
    emit(AppLoadingState(isLoading: isLoading));
  }

  /// Example method to update the user authentication state.
  void updateAuthState(bool isLoggedIn) {
    emit(AppAuthStateChanged(isLoggedIn: isLoggedIn));
  }

  /// Example method to update the app connectivity state.
  void updateConnectivityState(bool isConnected) {
    emit(AppConnectivityStateChanged(isConnected: isConnected));
  }
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