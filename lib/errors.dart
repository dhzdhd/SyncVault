import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'errors.freezed.dart';

extension ErrorSegregation on Object {
  AppError segregateError() {
    if (this is AppError) {
      return this as AppError;
    } else if (this is DioException) {
      final error = this as DioException;
      return HttpError(error.response.toString());
    } else if (this is Exception) {
      return GeneralError(toString());
    } else {
      throw NoSuchMethodError.withInvocation(
        this,
        Invocation.method(
          const Symbol('segregateError'),
          null,
        ),
      );
    }
  }
}

@freezed
sealed class AppError with _$AppError {
  const factory AppError.http(String message) = HttpError;
  const factory AppError.general(String message) = GeneralError;
}

// sealed class AppError implements Exception {
//   final String message;
//   final String stackTrace;

//   AppError({required this.message, required this.stackTrace});

//   String get message => message;
//   String get stackTrace;
// }
