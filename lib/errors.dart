import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'errors.freezed.dart';

extension ErrorSegregation on Object {
  AppError segregateError() {
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

    // if (this is AppError) {
    //   return this as AppError;
    // } else if (this is DioException) {
    //   final error = this as DioException;
    //   return HttpError(error.response.toString());
    // } else if (this is Exception) {
    //   return GeneralError(toString());
    // } else {
    //   throw NoSuchMethodError.withInvocation(
    //     this,
    //     Invocation.method(
    //       const Symbol('segregateError'),
    //       null,
    //     ),
    //   );
    // }
  }
}

@freezed
sealed class AppError with _$AppError {
  const factory AppError.http(String message) = HttpError;
  const factory AppError.general(String message) = GeneralError;
}
