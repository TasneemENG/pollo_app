import 'package:flutter_bloc/flutter_bloc.dart';
import 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(const BottomNavInitial());

  void updateIndex(int index) {
    if (state.index != index) {
      emit(BottomNavUpdated(index));
    }
  }
}
