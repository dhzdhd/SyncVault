import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syncvault/src/introduction/models/intro_model.dart';
import 'package:syncvault/src/introduction/services/intro_service.dart';

part 'intro_controller.g.dart';

@riverpod
class IntroSettings extends _$IntroSettings {
  final _service = IntroService();

  @override
  IntroSettingsModel build() {
    return _service.fetch();
  }

  void setAlreadyViewed() {
    // _service.put()
  }
}
