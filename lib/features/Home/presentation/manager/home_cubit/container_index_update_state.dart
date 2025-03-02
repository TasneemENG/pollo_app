import 'package:equatable/equatable.dart';

class ContainerIndexState extends Equatable {
  final int index;

  const ContainerIndexState(this.index);

  @override
  List<Object> get props => [index];
}