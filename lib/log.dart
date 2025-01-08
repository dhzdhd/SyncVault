import 'dart:io';

import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

final debugLogger = Logger();
final fileLogger = Logger(
  printer: SimplePrinter(printTime: true, colors: false),
  filter: CustomLogFilter(),
  output: FileLogOutput(),
);
final sentryLogger = Logger(
  filter: CustomLogFilter(),
  output: SentryLogOutput(),
);

final class CustomLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return event.level != Level.debug;
  }
}

final class FileLogOutput extends LogOutput {
  @override
  void output(OutputEvent event) async {
    final date = DateTime.now();
    final dateString = '${date.day}-${date.month}-${date.year}';

    final docDir = await getApplicationDocumentsDirectory();
    final dir = await Directory('${docDir.path}/SyncVault/logs/')
        .create(recursive: true);

    final file = await File('${dir.path}/$dateString.log').create();

    for (final line in [...event.lines, '\n']) {
      await file.writeAsString(line, mode: FileMode.append);
    }
  }
}

final class SentryLogOutput extends LogOutput {
  @override
  void output(OutputEvent event) async {
    await Sentry.captureException(
      event.origin.error,
      stackTrace: event.origin.stackTrace,
    );
  }
}
