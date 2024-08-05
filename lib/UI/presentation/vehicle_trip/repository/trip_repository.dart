import 'package:admin_app/core/api_end_points/api_end_points.dart';
import 'package:admin_app/core/dataSource/token_manager.dart';
import 'package:admin_app/core/error/failure.dart';
import 'package:admin_app/core/models/common_model.dart';
import 'package:admin_app/core/service/api_service.dart';
import 'package:either_dart/either.dart';

final class VehicleTripRepository {
  final ApiService apiService;

  final TokenManager tokenManager;
  VehicleTripRepository({
    required this.apiService,
    required this.tokenManager,
  });

  Future<Either<ErrorModel, CommonModel>> getTrips({
    required String vehicleId,
    required String start,
    required String to,
  }) async {
    final String? token = await tokenManager.getToken();
    final response =
        await apiService.post(APIEndpoints.tripDetails, token: token, body: {
      "vehicle_id": vehicleId,
      "fromEpoch": start,
      "toEpoch": to,
    });

    if (response.isLeft) {
      return Left(
        ErrorModel(
          response.left.apiError,
        ),
      );
    } else {
      return Right(CommonModel.fromJson(response.right));
    }
  }
}
