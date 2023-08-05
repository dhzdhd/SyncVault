import 'package:dio/dio.dart';

extension ErrorSegregation on Object {
  AppError segregateError() {
    if (this is AppError) {
      return this as AppError;
    } else if (this is DioError) {
      final error = this as DioError;
      return HttpError(
        message: error.response.toString(),
        stackTrace: error.stackTrace.toString(),
      );
    } else {
      return GeneralError(message: toString(), stackTrace: 'No stacktrace');
    }
  }
}

sealed class AppError implements Exception {
  String get message;
  String get stackTrace;
}

class HttpError implements AppError {
  @override
  final String message;

  @override
  final String stackTrace;

  HttpError({required this.message, required this.stackTrace});
}

class GeneralError implements AppError {
  @override
  final String message;

  @override
  final String stackTrace;

  GeneralError({required this.message, required this.stackTrace});
}
