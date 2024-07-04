import 'package:admin_app/UI/presentation/dashboard/models/revenue_model.dart';
import 'package:admin_app/UI/presentation/dashboard/repository/dashboard_repository.dart';
import 'package:admin_app/core/service/dependancy_injection.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_cubit.freezed.dart';
part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final DashboardRepository _dashboardRepository =
      locator<DashboardRepository>();
  DashboardCubit() : super(const DashboardState.initial());
  getRevenue(
      {required String selectedPeriod,
      required String start,
      required String end}) async {
    emit(const DashboardState.loading());
    var res = await _dashboardRepository.getRevenue(start: start, end: end);

    res.fold(
      (left) => emit(DashboardState.error(left.message!)),
      (right) => emit(DashboardState.success(
        RevenueModel.fromJson(right.data),
        selectedPeriod,
      )),
    );
  }
}
