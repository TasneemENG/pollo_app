import 'package:flutter_riverpod/flutter_riverpod.dart';

final appStateProvider = StateNotifierProvider<AppStateNotifier, AppState>((ref) {
  return AppStateNotifier();
});

class AppState {
  final bool isLoggedIn;

  AppState({this.isLoggedIn = false});
}

class AppStateNotifier extends StateNotifier<AppState> {
  AppStateNotifier() : super(AppState());

  void login() {
    state = AppState(isLoggedIn: true);
  }

  void logout() {
    state = AppState(isLoggedIn: false);
  }
}