import 'dart:developer';

import 'package:admin_app/core/error/failure.dart';
import 'package:admin_app/core/error/network_info.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

class ApiService {
  final Dio _dio;
  final NetworkInfo networkInfo;
  ApiService(this.networkInfo) : _dio = Dio();

  Future<Either<ErrorModel, dynamic>> get(
    String endpoint, {
    String? token,
    dynamic body,
  }) async {
    if (await networkInfo.isConnected) {
      log(" internet connection  ${await networkInfo.isConnected}");
      try {
        if (token != null) {
          log(token);
          _dio.options.headers = {'token': token};
        }
        final response = await _dio.get(
          endpoint,
          data: body,
        );
        log("Response ${response.data}");
        if (response.statusCode == 200) {
          final responseData = response.data;
          return Right(responseData);
        } else {
          return Left(
            ErrorModel(ApiError.other, message: response.data['message']),
          );
        }
      } on DioException catch (e) {
        log("DioException ${e.error}");
        // Handle the status code and convert it to an ApiError
        final ApiError error = mapStatusCodeToApiError(e.response!.statusCode!);

        return Left(
          ErrorModel(error, message: e.response!.data['message']),
        );
      }
    } else {
      return Left(
        ErrorModel(
          ApiError.internetError,
        ),
      );
    }
  }

  Future<Either<ErrorModel, dynamic>> post(
    String endpoint, {
    dynamic body,
    String? token,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        if (token != null) {
          log(token);
          _dio.options.headers = {'token': token};
        }
        final response = await _dio.post(
          endpoint,
          // queryParameters: queryParameters,
          data: body,
        );
        log("Response ${response.data}");
        if (response.statusCode == 200) {
          final responseData = response.data;
          return Right(responseData);
        } else {
          return Left(
            ErrorModel(ApiError.other, message: response.data["message"]),
          );
        }
      } on DioException catch (e) {
        log("DioException $e");
        log("DioException ${e.response!.statusCode}");
        // Handle the status code and convert it to an ApiError
        final ApiError error = mapStatusCodeToApiError(e.response!.statusCode!);

        return Left(
          ErrorModel(
            error,
          ),
        );
      }
    } else {
      return Left(
        ErrorModel(
          ApiError.internetError,
        ),
      );
    }
  }

  Future<Either<ErrorModel, dynamic>> put(
    String endpoint, {
    dynamic body,
    String? token,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        if (token != null) {
          _dio.options.headers = {'token': token};
        }
        final response = await _dio.put(
          endpoint,
          data: body,
        );
        log(response.data.toString());
        if (response.statusCode == 200) {
          final responseData = response.data;
          return Right(responseData);
        } else {
          return Left(
            ErrorModel(ApiError.other, message: response.data["message"]),
          );
        }
      } on DioException catch (e) {
        // Handle the status code and convert it to an ApiError
        final ApiError error = mapStatusCodeToApiError(e.response!.statusCode!);

        return Left(
          ErrorModel(
            error,
          ),
        );
      }
    } else {
      return Left(
        ErrorModel(
          ApiError.internetError,
        ),
      );
    }
  }
}
