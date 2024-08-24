part of 'vehicle_trip_cubit.dart';

@freezed
class VehicleTripState with _$VehicleTripState {
  const factory VehicleTripState.error(String message) = _Error;
  const factory VehicleTripState.initial() = _Initial;
  const factory VehicleTripState.loading() = _Loading;
  const factory VehicleTripState.success(List<TripModel> tripListModel) =
      _Success;
}
