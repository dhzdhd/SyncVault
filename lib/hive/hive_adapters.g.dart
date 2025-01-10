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
      case 5:
        return DriveProvider.protonDrive;
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
      case DriveProvider.protonDrive:
        writer.writeByte(5);
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
      authJson: (fields[4] as Map).cast<String, dynamic>(),
      accessToken: fields[1] as String,
      refreshToken: fields[2] as String,
      expiresIn: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, OAuth2 obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.accessToken)
      ..writeByte(2)
      ..write(obj.refreshToken)
      ..writeByte(3)
      ..write(obj.expiresIn)
      ..writeByte(4)
      ..write(obj.authJson);
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
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return S3(
      url: fields[0] as String,
      accessKeyId: fields[1] as String,
      secretAccessKey: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, S3 obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.accessKeyId)
      ..writeByte(2)
      ..write(obj.secretAccessKey);
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
      remoteParentPath: fields[7] as String,
      isAutoSync: fields[4] as bool,
      isDeletionEnabled: fields[5] as bool,
      isTwoWaySync: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, FolderModel obj) {
    writer
      ..writeByte(8)
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
      ..write(obj.isTwoWaySync)
      ..writeByte(7)
      ..write(obj.remoteParentPath);
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

class UserPasswordAdapter extends TypeAdapter<UserPassword> {
  @override
  final int typeId = 12;

  @override
  UserPassword read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserPassword(
      username: fields[0] as String,
      password: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserPassword obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserPasswordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
