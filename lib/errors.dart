import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:syncvault/log.dart';

part 'errors.freezed.dart';

extension ErrorSegregation on Object {
  AppError handleError() {
    try {
      if (this is Error) {
        final error = this as Error;
        debugLogger.e('Error',
            error: error, stackTrace: error.stackTrace, time: DateTime.now());
        fileLogger.e('Error',
            error: error, stackTrace: error.stackTrace, time: DateTime.now());
      } else if (this is AppError) {
        final error = this as AppError;
        debugLogger.e(error.message, error: error, time: DateTime.now());
        fileLogger.e(error.message, error: error, time: DateTime.now());
      }
    } catch (err) {
      debugLogger.i('Error passed cannot be type cast to Error');
    }

    // TODO: Log errors and return readable errors
    return switch (this) {
      AppError err => err,
      DioException err => HttpError(err.response.toString()),
      StateError err => GeneralError(err.toString()),
      Exception err => GeneralError(err.toString()),
      Error err => GeneralError(err.toString()),
      Object err => throw NoSuchMethodError.withInvocation(
          err,
          Invocation.method(
            const Symbol('handleError'),
            null,
          ),
        )
    };
  }
}

@freezed
sealed class AppError with _$AppError {
  const factory AppError.http(String message) = HttpError;
  const factory AppError.general(String message) = GeneralError;
}
