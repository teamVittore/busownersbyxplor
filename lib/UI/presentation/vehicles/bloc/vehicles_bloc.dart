import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'vehicles_event.dart';
part 'vehicles_state.dart';

class VehiclesBloc extends Bloc<VehiclesEvent, VehiclesState> {
  VehiclesBloc() : super(VehiclesInitial()) {
    on<VehiclesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
