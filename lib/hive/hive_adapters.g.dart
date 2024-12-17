// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class ThemeModeAdapter extends TypeAdapter<ThemeMode> {
  @override
  final int typeId = 0;

  @override
  ThemeMode read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ThemeMode.system;
      case 1:
        return ThemeMode.light;
      case 2:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  @override
  void write(BinaryWriter writer, ThemeMode obj) {
    switch (obj) {
      case ThemeMode.system:
        writer.writeByte(0);
      case ThemeMode.light:
        writer.writeByte(1);
      case ThemeMode.dark:
        writer.writeByte(2);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeModeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SettingsModelAdapter extends TypeAdapter<SettingsModel> {
  @override
  final int typeId = 1;

  @override
  SettingsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingsModel(
      isSentryEnabled: fields[3] as bool,
      isHideOnStartup: fields[4] as bool,
      themeMode: fields[5] as ThemeMode,
    );
  }

  @override
  void write(BinaryWriter writer, SettingsModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(3)
      ..write(obj.isSentryEnabled)
      ..writeByte(4)
      ..write(obj.isHideOnStartup)
      ..writeByte(5)
      ..write(obj.themeMode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class IntroSettingsModelAdapter extends TypeAdapter<IntroSettingsModel> {
  @override
  final int typeId = 2;

  @override
  IntroSettingsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IntroSettingsModel(
      alreadyViewed: fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, IntroSettingsModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.alreadyViewed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IntroSettingsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
