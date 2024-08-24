import 'package:admin_app/UI/presentation/route/models/route_detail_model.dart';
import 'package:admin_app/UI/presentation/route/repository/route_repository.dart';
import 'package:admin_app/core/service/dependancy_injection.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_cubit.freezed.dart';
part 'route_state.dart';

class RouteCubit extends Cubit<RouteState> {
  final RouteRepository _repository = locator<RouteRepository>();
  RouteCubit() : super(const RouteState.initial());
  getRoute({required String vehicleId}) async {
    emit(const RouteState.loading());
    var res = await _repository.getRoutes(vehicleID: vehicleId);

    res.fold(
        (left) => emit(RouteState.error(left.message!)),
        (right) => emit(
              RouteState.sucess(
                  List<RouteDetailModel>.from(
                    right.data["originalRouteDetails"].map(
                      (x) => RouteDetailModel.fromJson(x),
                    ),
                  ),
                  List<OriginalRouteDetails>.from(
                    right.data["routeDetails"].map(
                      (x) => OriginalRouteDetails.fromJson(x),
                    ),
                  )),
            ));
  }
}
