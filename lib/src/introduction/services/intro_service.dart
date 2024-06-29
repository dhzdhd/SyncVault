import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:syncvault/log.dart';
import 'package:syncvault/src/introduction/models/intro_model.dart';

class IntroService {
  IntroSettingsModel fetch() {
    const defaultValue = IntroSettingsModel(alreadyViewed: false);

    try {
      final Map<String, dynamic> raw = jsonDecode(
        Hive.box('vault').get(
          'introSettings',
          defaultValue: jsonEncode(defaultValue.toJson()),
        ),
      );

      return IntroSettingsModel.fromJson(raw);
    } catch (err) {
      debugLogger.e('SettingsModel failed to initialize');
      fileLogger.e('SettingsModel failed to initialize');

      return defaultValue;
    }
  }
}
