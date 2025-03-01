import 'package:flutter_bloc/flutter_bloc.dart';

// Define the Cubit
class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0); // Initial state is 0 (Home)

  // Method to update the selected index
  void updateIndex(int index) {
    emit(index); // Emit the new index as the state
  }
}