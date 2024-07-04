// Define an enum to represent different types of errors
// Define a function to map status codes to ApiError enum values
String getMessageForApiError(ApiError apiError) {
  switch (apiError) {
    case ApiError.badRequestError:
      return 'Bad request error occurred.';
    case ApiError.unauthorizedError:
      return 'Unauthorized error occurred.';
    case ApiError.forbiddenError:
      return 'Forbidden error occurred.';
    case ApiError.notFoundError:
      return 'Resource not found error occurred.';
    case ApiError.serverError:
      return 'Server error occurred.';
    default:
      return 'An error occurred.';
  }
}

ApiError mapStatusCodeToApiError(int statusCode) {
  switch (statusCode) {
    case 400:
      return ApiError.badRequestError;
    case 401:
      return ApiError.unauthorizedError;
    case 403:
      return ApiError.forbiddenError;
    case 404:
      return ApiError.notFoundError;
    case 500:
      return ApiError.serverError;
    default:
      return ApiError.other;
  }
}

enum ApiError {
  internetError,
  tokenError,
  serverError,
  notFoundError,
  unauthorizedError,
  forbiddenError,
  badRequestError,
  other
}

class ErrorModel {
  final ApiError apiError;
  final String? message;

  ErrorModel(this.apiError, {this.message});
}

class Failure {
  final String message;

  Failure(this.message);
}
