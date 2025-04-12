import 'package:freezed_annotation/freezed_annotation.dart';

part 'intro_model.freezed.dart';
part 'intro_model.g.dart';

@freezed
abstract class IntroSettingsModel with _$IntroSettingsModel {
  const factory IntroSettingsModel({required bool alreadyViewed}) =
      _IntroSettingsModel;

  factory IntroSettingsModel.fromJson(Map<String, Object?> json) =>
      _$IntroSettingsModelFromJson(json);

  factory IntroSettingsModel.defaultValue() =>
      const IntroSettingsModel(alreadyViewed: false);
}
