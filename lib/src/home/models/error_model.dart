sealed class AppError {
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
