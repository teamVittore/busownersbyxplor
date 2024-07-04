import 'package:admin_app/core/api_end_points/api_end_points.dart';
import 'package:admin_app/core/dataSource/token_manager.dart';
import 'package:admin_app/core/error/failure.dart';
import 'package:admin_app/core/models/common_model.dart';
import 'package:admin_app/core/service/api_service.dart';
import 'package:either_dart/either.dart';

class ProfileRepository {
  final ApiService apiService;

  final TokenManager tokenManager;
  ProfileRepository({
    required this.apiService,
    required this.tokenManager,
  });
  Future<Either<ErrorModel, CommonModel>> getProfile() async {
    final String? token = await tokenManager.getToken();
    final response = await apiService.get(
      APIEndpoints.profile,
      token: token,
    );

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
