import 'package:admin_app/UI/presentation/home/model/vehicle_model.dart';
import 'package:admin_app/UI/presentation/vehicle_trip/repository/trip_repository.dart';
import 'package:admin_app/core/service/dependancy_injection.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_trip_cubit.freezed.dart';
part 'vehicle_trip_state.dart';

class VehicleTripCubit extends Cubit<VehicleTripState> {
  final VehicleTripRepository _vehicleTripRepository =
      locator<VehicleTripRepository>();
  VehicleTripCubit() : super(const VehicleTripState.initial());
  getTripDetail({
    required String vehicleId,
    required String start,
    required String to,
  }) async {
    emit(const VehicleTripState.loading());
    var res = await _vehicleTripRepository.getTrips(
        vehicleId: vehicleId, start: start, to: to);
    res.fold(
      (left) => emit(VehicleTripState.error(left.message!)),
      (right) => emit(VehicleTripState.success(List<VehicleModel>.from(
          right.data.map((x) => VehicleModel.fromJson(x))))),
    );
  }
}
