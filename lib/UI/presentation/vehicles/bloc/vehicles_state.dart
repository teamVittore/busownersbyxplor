part of 'vehicles_bloc.dart';

final class VehicalErrorState extends VehiclesState {
  final String message;

  const VehicalErrorState({required this.message});
}

final class VehicalLoadedState extends VehiclesState {}

final class VehicalLoadingState extends VehiclesState {}

final class VehiclesInitial extends VehiclesState {}

sealed class VehiclesState extends Equatable {
  const VehiclesState();

  @override
  List<Object> get props => [];
}
