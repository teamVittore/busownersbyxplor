import 'dart:developer';

import 'package:admin_app/core/api_end_points/api_end_points.dart';
import 'package:admin_app/core/dataSource/token_manager.dart';
import 'package:admin_app/core/error/failure.dart';
import 'package:admin_app/core/models/common_model.dart';
import 'package:admin_app/core/service/api_service.dart';
import 'package:either_dart/either.dart';

class DashboardRepository {
  final ApiService apiService;
  final TokenManager tokenManager;

  DashboardRepository({
    required this.apiService,
    required this.tokenManager,
  });

  Future<Either<ErrorModel, CommonModel>> getRevenue(
      {required String start, required String end}) async {
    final String? token = await tokenManager.getToken();
    final response =
        await apiService.post(APIEndpoints.revenue, token: token, body: {
      "dateRange": {"fromEpoch": start, "toEpoch": end}
    });
    log(start);
    log(end);
    if (response.isLeft) {
      return Left(
        ErrorModel(response.left.apiError ?? ApiError.other,
            message: response.left.message ?? "Server Error"),
      );
    } else {
      return Right(CommonModel.fromJson(response.right));
    }
  }
}
