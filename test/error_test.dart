import 'package:flutter_test/flutter_test.dart';
import 'package:syncvault/errors.dart';

void main() {
  group('AppError Tests', () {
    test('ValidationError should include field name in message when provided', () {
      final error = AppError.validation(
        'Invalid input',
        'username',
        null,
        null,
      );

      expect(error.message, contains('Invalid input'));
      expect(error.message, contains('username'));
      expect(error.message, contains('field:'));
    });

    test('ValidationError should work without field name', () {
      final error = AppError.validation(
        'Invalid input',
        null,
        null,
        null,
      );

      expect(error.message, contains('Invalid input'));
      expect(error.message, isNot(contains('field:')));
    });

    test('ValidationError should store field correctly', () {
      final error = AppError.validation(
        'Invalid email format',
        'email',
        null,
        null,
      ) as ValidationError;

      expect(error.reason, equals('Invalid email format'));
      expect(error.field, equals('email'));
    });

    test('GeneralError should display message correctly', () {
      final error = AppError.general(
        'Something went wrong',
        null,
        null,
      );

      expect(error.message, contains('GeneralError'));
      expect(error.message, contains('Something went wrong'));
    });
  });
}
