import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:syncvault/log.dart';
import 'package:syncvault/src/home/models/drive_provider.dart';

part 'errors.freezed.dart';

enum ProviderOperationType {
  authorize,
  getDriveInfo,
  getTreeView,
  remoteCreation,
  upload,
  download,
  delete,
}

enum AuthErrorType { unauthorized, forbidden, tokenExpired }

enum StorageErrorType { create, update, delete }

enum StorageProviderType { rCloneConfig, hive }

@freezed
sealed class AppError with _$AppError implements Exception {
  const AppError._();

  const factory AppError.http(
    String endpoint,
    int status,
    dynamic response,
    Object? error,
    StackTrace? stackTrace,
  ) = HttpError;
  const factory AppError.auth(
    AuthErrorType type,
    Object? error,
    StackTrace? stackTrace,
  ) = AuthError;
  const factory AppError.provider(
    DriveProvider provider,
    ProviderOperationType operation,
    Object? error,
    StackTrace? stackTrace,
  ) = ProviderError;
  const factory AppError.storage(
    StorageErrorType type,
    StorageProviderType provider,
    Object? error,
    StackTrace? stackTrace,
  ) = StorageError;
  const factory AppError.validation(
    // TODO: Add which field failed
    String reason,
    Object? error,
    StackTrace? stackTrace,
  ) = ValidationError;
  const factory AppError.general(
    String message,
    Object? error,
    StackTrace? stackTrace,
  ) = GeneralError;

  String get message => switch (this) {
    HttpError(:final endpoint, :final status) =>
      'HttpError: $endpoint responded with status code $status',
    AuthError(:final type) =>
      """AuthError: ${switch (type) {
        AuthErrorType.unauthorized => 'Unauthorized',
        AuthErrorType.forbidden => 'Forbidden',
        AuthErrorType.tokenExpired => 'Token expired',
      }}""",
    ProviderError(:final provider) =>
      'ProviderError: $provider raised an error',
    StorageError(:final type) =>
      """StorageError: ${switch (type) {
        StorageErrorType.create => 'Error in storing created entity',
        StorageErrorType.update => 'Error in updating entity',
        StorageErrorType.delete => 'Error in deleting entity',
      }}""",
    ValidationError(:final reason) =>
      'ValidationError: The input is invalid due to $reason',
    GeneralError(:final message) => 'GeneralError: $message',
  };

  AppError logError() {
    if (kDebugMode) {
      debugLogger.e(
        message,
        error: error ?? this,
        stackTrace: stackTrace,
        time: DateTime.now(),
      );
    }
    fileLogger.e(
      message,
      error: error ?? this,
      stackTrace: stackTrace,
      time: DateTime.now(),
    );
    sentryLogger.e(
      message,
      error: error ?? this,
      stackTrace: stackTrace,
      time: DateTime.now(),
    );

    return this;
  }
}
