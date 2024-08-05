part of 'dashboard_cubit.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.error(String message) = _Error;
  const factory DashboardState.initial() = _Initial;
  const factory DashboardState.loading() = _Loading;

  const factory DashboardState.success(
      RevenueModel revenueModel, String selectedPeriod,
      {required String start, required String end}) = _Success;
}
