import 'package:equatable/equatable.dart';

abstract class BottomNavState extends Equatable {
  final int index;
  const BottomNavState(this.index);

  @override
  List<Object> get props => [index];
}

class BottomNavInitial extends BottomNavState {
  const BottomNavInitial() : super(0);
}

class BottomNavUpdated extends BottomNavState {
  const BottomNavUpdated(int index) : super(index);
}
