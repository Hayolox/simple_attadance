import 'package:dio/dio.dart';
import 'package:mobile_banking/common/error/failure_response.dart';

class ErrorHandler implements Exception {
  late FailureResponse failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = _handleError(error);
    } else {
      failure = DataSource.defaults.getFailure();
    }
  }
}

FailureResponse _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectionTimeout.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeout.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeout.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return FailureResponse(
          statusCode: error.response?.statusCode ?? 0,
          errorMessage: error.response?.statusMessage ?? "",
          responseCode: error.response!.statusCode.toString(),
        );
      } else {
        return DataSource.defaults.getFailure();
      }
    case DioExceptionType.unknown:
      Map<String, dynamic> err = error.response!.data as Map<String, dynamic>;
      String code = err['code'] as String;
      String message = err['message'] as String;
      return code.getFailure(message);
    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();
    default:
      return DataSource.defaults.getFailure();
  }
}

extension ResponseCodeExtension on String {
  FailureResponse getFailure(String message) {
    switch (this) {
      case ResponseCode.dataNotFound:
        return FailureResponse(
          statusCode: ResponseStatusCode.success,
          errorMessage: message,
          responseCode: this,
        );

      default:
        return FailureResponse(
          statusCode: ResponseStatusCode.success,
          errorMessage: message,
          responseCode: this,
        );
      // return FailureResponse(
      //   statusCode: ResponseStatusCode.defaults,
      //   errorMessage: 'Something went wrong, please try again later',
      // );
    }
  }
}

extension DataSourceExtension on DataSource {
  FailureResponse getFailure() {
    switch (this) {
      case DataSource.success:
        return FailureResponse(
          statusCode: ResponseStatusCode.success,
          errorMessage: 'Success',
        );
      case DataSource.noContent:
        return FailureResponse(
          statusCode: ResponseStatusCode.noContent,
          errorMessage: 'Success with not content',
        );
      case DataSource.badRequest:
        return FailureResponse(
          statusCode: ResponseStatusCode.badRequest,
          errorMessage: 'Bad request. try again later',
        );
      case DataSource.forbidden:
        return FailureResponse(
          statusCode: ResponseStatusCode.forbidden,
          errorMessage: 'Forbidden request. try again later',
        );
      case DataSource.unAuthorized:
        return FailureResponse(
          statusCode: ResponseStatusCode.unAuthorized,
          errorMessage: 'User unauthorized, try again later',
        );
      case DataSource.notFound:
        return FailureResponse(
          statusCode: ResponseStatusCode.notFound,
          errorMessage: 'Url not found, please try again later',
        );
      case DataSource.internalServerError:
        return FailureResponse(
          statusCode: ResponseStatusCode.internalServerError,
          errorMessage: 'Something went wrong, please try again later',
        );
      case DataSource.connectionTimeout:
        return FailureResponse(
          statusCode: ResponseStatusCode.connectionTimeout,
          errorMessage: 'Timeout, please try again later',
        );
      case DataSource.cancel:
        return FailureResponse(
          statusCode: ResponseStatusCode.cancel,
          errorMessage: 'Something went wrong, please try again later',
        );
      case DataSource.receiveTimeout:
        return FailureResponse(
          statusCode: ResponseStatusCode.receiveTimeout,
          errorMessage: 'Timeout, please try again later',
        );
      case DataSource.sendTimeout:
        return FailureResponse(
          statusCode: ResponseStatusCode.sendTimeout,
          errorMessage: 'Timeout, please try again later',
        );
      case DataSource.cacheError:
        return FailureResponse(
          statusCode: ResponseStatusCode.cacheError,
          errorMessage: 'Cache error, please try again later',
        );
      case DataSource.noInternetConnection:
        return FailureResponse(
          statusCode: ResponseStatusCode.noInternetConnection,
          errorMessage: 'Please check your internet connection',
        );
      case DataSource.defaults:
        return FailureResponse(
          statusCode: ResponseStatusCode.defaults,
          errorMessage: 'Something went wrong, please try again later',
        );
    }
  }
}

class ResponseStatusCode {
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no data (no content)
  static const int badRequest = 400; // failure, API rejected request
  static const int unAuthorized = 401; // failure, user is not authorised
  static const int forbidden = 403; //  failure, API rejected request
  static const int internalServerError = 500; // failure, crash in server side
  static const int notFound = 404; // failure, not found

  // local status code
  static const int connectionTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int defaults = -7;
}

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unAuthorized,
  notFound,
  internalServerError,
  connectionTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  defaults,
}

class ResponseCode {
  static const String success = '00';
  static const String internalServerError = '99';
  static const String dataNotFound = '80';
  static const String softTokenNotActive = '7G';
  static const String userDeviceNotFound = '71';
  static const String sessionExpired = 'SE';
}
