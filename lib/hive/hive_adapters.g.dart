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

class DriveProviderModelAdapter extends TypeAdapter<DriveProviderModel> {
  @override
  final int typeId = 3;

  @override
  DriveProviderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DriveProviderModel(
      remoteName: fields[6] as String,
      provider: fields[7] as DriveProvider,
      backend: fields[8] as DriveProviderBackend,
    );
  }

  @override
  void write(BinaryWriter writer, DriveProviderModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(6)
      ..write(obj.remoteName)
      ..writeByte(7)
      ..write(obj.provider)
      ..writeByte(8)
      ..write(obj.backend);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DriveProviderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DriveProviderAdapter extends TypeAdapter<DriveProvider> {
  @override
  final int typeId = 4;

  @override
  DriveProvider read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DriveProvider.oneDrive;
      case 1:
        return DriveProvider.googleDrive;
      case 2:
        return DriveProvider.dropBox;
      case 3:
        return DriveProvider.minio;
      case 4:
        return DriveProvider.nextCloud;
      default:
        return DriveProvider.oneDrive;
    }
  }

  @override
  void write(BinaryWriter writer, DriveProvider obj) {
    switch (obj) {
      case DriveProvider.oneDrive:
        writer.writeByte(0);
      case DriveProvider.googleDrive:
        writer.writeByte(1);
      case DriveProvider.dropBox:
        writer.writeByte(2);
      case DriveProvider.minio:
        writer.writeByte(3);
      case DriveProvider.nextCloud:
        writer.writeByte(4);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DriveProviderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OAuth2Adapter extends TypeAdapter<OAuth2> {
  @override
  final int typeId = 5;

  @override
  OAuth2 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OAuth2(
      rCloneJson: (fields[0] as Map).cast<String, dynamic>(),
      accessToken: fields[1] as String,
      refreshToken: fields[2] as String,
      expiresIn: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, OAuth2 obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.rCloneJson)
      ..writeByte(1)
      ..write(obj.accessToken)
      ..writeByte(2)
      ..write(obj.refreshToken)
      ..writeByte(3)
      ..write(obj.expiresIn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OAuth2Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class S3Adapter extends TypeAdapter<S3> {
  @override
  final int typeId = 6;

  @override
  S3 read(BinaryReader reader) {
    return S3();
  }

  @override
  void write(BinaryWriter writer, S3 obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is S3Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WebdavAdapter extends TypeAdapter<Webdav> {
  @override
  final int typeId = 7;

  @override
  Webdav read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Webdav(
      url: fields[0] as String,
      user: fields[1] as String,
      password: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Webdav obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.user)
      ..writeByte(2)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WebdavAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OAuth2PayloadAdapter extends TypeAdapter<OAuth2Payload> {
  @override
  final int typeId = 8;

  @override
  OAuth2Payload read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OAuth2Payload(
      remoteName: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, OAuth2Payload obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.remoteName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OAuth2PayloadAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class S3PayloadAdapter extends TypeAdapter<S3Payload> {
  @override
  final int typeId = 9;

  @override
  S3Payload read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return S3Payload(
      remoteName: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, S3Payload obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.remoteName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is S3PayloadAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WebdavPayloadAdapter extends TypeAdapter<WebdavPayload> {
  @override
  final int typeId = 10;

  @override
  WebdavPayload read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WebdavPayload(
      remoteName: fields[0] as String,
      url: fields[1] as String,
      user: fields[2] as String,
      password: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WebdavPayload obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.remoteName)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.user)
      ..writeByte(3)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WebdavPayloadAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FolderModelAdapter extends TypeAdapter<FolderModel> {
  @override
  final int typeId = 11;

  @override
  FolderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FolderModel(
      remoteName: fields[0] as String,
      provider: fields[1] as DriveProvider,
      folderPath: fields[2] as String,
      folderName: fields[3] as String,
      isAutoSync: fields[4] as bool,
      isDeletionEnabled: fields[5] as bool,
      isTwoWaySync: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, FolderModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.remoteName)
      ..writeByte(1)
      ..write(obj.provider)
      ..writeByte(2)
      ..write(obj.folderPath)
      ..writeByte(3)
      ..write(obj.folderName)
      ..writeByte(4)
      ..write(obj.isAutoSync)
      ..writeByte(5)
      ..write(obj.isDeletionEnabled)
      ..writeByte(6)
      ..write(obj.isTwoWaySync);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FolderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
