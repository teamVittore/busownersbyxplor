part of 'home_cubit.dart';

final class HomeInitial extends HomeState {}

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class VehicleFecthedState extends HomeState {
  final List<VehicleModel> list;

  const VehicleFecthedState({required this.list});
}

final class VehicleFetchedErrorState extends HomeState {
  final String error;

  const VehicleFetchedErrorState({required this.error});
}

final class VehicleFetchInitial extends HomeState {}
