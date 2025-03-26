// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingsModelImpl _$$SettingsModelImplFromJson(Map<String, dynamic> json) =>
    _$SettingsModelImpl(
      isSentryEnabled: json['isSentryEnabled'] as bool,
      isHideOnStartup: json['isHideOnStartup'] as bool,
      isLaunchOnStartup: json['isLaunchOnStartup'] as bool,
      themeMode: $enumDecode(_$ThemeModeEnumMap, json['themeMode']),
    );

Map<String, dynamic> _$$SettingsModelImplToJson(_$SettingsModelImpl instance) =>
    <String, dynamic>{
      'isSentryEnabled': instance.isSentryEnabled,
      'isHideOnStartup': instance.isHideOnStartup,
      'isLaunchOnStartup': instance.isLaunchOnStartup,
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};
