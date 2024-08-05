import 'package:admin_app/UI/presentation/auth/bloc/auth_bloc.dart';
import 'package:admin_app/UI/presentation/dashboard/cubit/dashboard_cubit.dart';
import 'package:admin_app/UI/presentation/dashboard/repository/dashboard_repository.dart';
import 'package:admin_app/UI/presentation/home/repository/home_repository.dart';
import 'package:admin_app/UI/presentation/profile/cubit/profile_cubit.dart';
import 'package:admin_app/UI/presentation/profile/repository/profile_repository.dart';
import 'package:admin_app/UI/presentation/route/cubit/route_cubit.dart';
import 'package:admin_app/UI/presentation/route/repository/route_repository.dart';
import 'package:admin_app/UI/presentation/vehicle_trip/cubit/vehicle_trip_cubit.dart';
import 'package:admin_app/UI/presentation/vehicle_trip/repository/trip_repository.dart';
import 'package:admin_app/core/dataSource/token_manager.dart';
import 'package:admin_app/core/error/network_info.dart';
import 'package:admin_app/core/repository/authentication/authentication_repository.dart';
import 'package:admin_app/core/service/api_service.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../UI/presentation/home/cubit/home_cubit.dart';

GetIt locator = GetIt.instance;

Future<void> serviceLocators() async {
  locator.registerLazySingleton(() => InternetConnectionChecker());
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));
  locator.registerLazySingleton<ApiService>(() => ApiService(locator()));

  locator.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepository(apiService: locator()),
  );
  locator.registerLazySingleton<TokenManager>(() => TokenManager());
  locator.registerLazySingleton<HomeRepository>(
    () => HomeRepository(
      apiService: locator(),
      tokenManager: locator(),
    ),
  );
  locator.registerLazySingleton<ProfileRepository>(
    () => ProfileRepository(
      apiService: locator(),
      tokenManager: locator(),
    ),
  );
  locator.registerLazySingleton<DashboardRepository>(
    () => DashboardRepository(
      apiService: locator(),
      tokenManager: locator(),
    ),
  );
  locator.registerLazySingleton<RouteRepository>(
    () => RouteRepository(
      apiService: locator(),
      tokenManager: locator(),
    ),
  );
  locator.registerLazySingleton<VehicleTripRepository>(
    () => VehicleTripRepository(
      apiService: locator(),
      tokenManager: locator(),
    ),
  );
  locator.registerLazySingleton(
    () => AuthBloc(),
  );
  locator.registerLazySingleton(
    () => HomeCubit(),
  );
  locator.registerLazySingleton(
    () => ProfileCubit(),
  );
  locator.registerLazySingleton(
    () => DashboardCubit(),
  );
  locator.registerLazySingleton(
    () => RouteCubit(),
  );
  locator.registerLazySingleton(
    () => VehicleTripCubit(),
  );
}
