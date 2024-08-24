part of 'route_cubit.dart';

@freezed
class RouteState with _$RouteState {
  const factory RouteState.error(String message) = _Error;
  const factory RouteState.initial() = _Initial;
  const factory RouteState.loading() = _Loading;
  const factory RouteState.sucess(List<RouteDetailModel> routes,
      List<OriginalRouteDetails> originalRouteDetails) = _Sucess;
}
