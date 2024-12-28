import 'dart:io';

import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

final debugLogger = Logger();
final fileLogger = Logger(
  printer:
      PrettyPrinter(dateTimeFormat: DateTimeFormat.dateAndTime, colors: false),
  filter: CustomLogFilter(),
  output: FileLogOutput(),
);
final sentryLogger = Logger(
  printer:
      PrettyPrinter(dateTimeFormat: DateTimeFormat.dateAndTime, colors: false),
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
    final dirUri = Uri.file('${docDir.uri.path}/SyncVault/logs/');
    final dir = await Directory.fromUri(dirUri).create(recursive: true);

    final fileUri = Uri.file('${dir.uri.path}$dateString.log');
    final file = File.fromUri(fileUri);

    for (final line in [...event.lines, '\n']) {
      await file.writeAsString(line, mode: FileMode.append);
    }
  }
}

final class SentryLogOutput extends LogOutput {
  @override
  void output(OutputEvent event) async {
    throw UnimplementedError();
  }
}
