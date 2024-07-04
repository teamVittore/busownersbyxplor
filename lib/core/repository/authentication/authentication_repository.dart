import 'package:admin_app/core/api_end_points/api_end_points.dart';
import 'package:admin_app/core/error/failure.dart';
import 'package:admin_app/core/models/common_model.dart';
import 'package:admin_app/core/service/api_service.dart';
import 'package:either_dart/either.dart';

class AuthenticationRepository {
  final ApiService apiService;

  AuthenticationRepository({required this.apiService});

  Future<Either<ErrorModel, CommonModel>> sendOtp({
    required String emailAddress,
  }) async {
    final response = await apiService.get(APIEndpoints.sendOTP + emailAddress);

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

  Future<Either<ErrorModel, CommonModel>> validateOTP({
    required String emailAddress,
    required int otp,
  }) async {
    final response = await apiService.post(
      "${APIEndpoints.validateOTP}?number=$emailAddress&otp=$otp",
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
