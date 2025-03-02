import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo/features/Home/presentation/manager/home_cubit/container_index_update_state.dart';

class ContainerIndexUpdateCubit extends Cubit<ContainerIndexState> {
  ContainerIndexUpdateCubit() : super(const ContainerIndexState(0));

  void updateIndex(int index) {
    emit(ContainerIndexState(index));
  }
}