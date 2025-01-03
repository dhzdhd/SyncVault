import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:syncvault/log.dart';

part 'errors.freezed.dart';

extension ErrorSegregation on Object {
  AppError segregateError() {
    try {
      final error = this as Error;
      debugLogger.e(error.toString());
      debugLogger.e(error.stackTrace);
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
            const Symbol('segregateError'),
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
