import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:syncvault/log.dart';

part 'errors.freezed.dart';

extension ErrorSegregation on Object {
  AppError handleError(String message, StackTrace stackTrace) {
    if (this is Error || this is AppError) {
      debugLogger.e(
        message,
        error: this,
        stackTrace: stackTrace,
        time: DateTime.now(),
      );
      fileLogger.e(
        message,
        error: this,
        stackTrace: stackTrace,
        time: DateTime.now(),
      );
      sentryLogger.e(message, stackTrace: stackTrace, time: DateTime.now());
    } else {
      debugLogger.e(
        message,
        error: this,
        stackTrace: stackTrace,
        time: DateTime.now(),
      );
    }

    // TODO: Log errors and return readable errors
    return switch (this) {
      AppError err => err,
      DioException err => HttpError(err.response.toString()),
      StateError err => GeneralError(err.toString()),
      Exception err => GeneralError(err.toString()),
      Error err => GeneralError(err.toString()),
      Object err =>
        throw NoSuchMethodError.withInvocation(
          err,
          Invocation.method(const Symbol('handleError'), null),
        ),
    };
  }
}

@freezed
sealed class AppError with _$AppError {
  const factory AppError.http(String message) = HttpError;
  const factory AppError.general(String message) = GeneralError;
}
