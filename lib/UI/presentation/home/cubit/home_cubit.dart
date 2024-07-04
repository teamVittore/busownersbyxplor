import 'package:admin_app/UI/presentation/home/model/vehicle_model.dart';
import 'package:admin_app/UI/presentation/home/repository/home_repository.dart';
import 'package:admin_app/core/service/dependancy_injection.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository = locator<HomeRepository>();
  HomeCubit() : super(HomeInitial());

  getVehicles() async {
    emit(VehicleFetchInitial());
    var res = await homeRepository.getVehicles();

    if (res.isLeft) {
    } else {
      List<VehicleModel> list = List<VehicleModel>.from(
          res.right.data["vehicleList"].map((x) => VehicleModel.fromJson(x)));

      emit(VehicleFecthedState(list: list));
    }
  }
}
