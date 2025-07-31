// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class ThemeModeAdapter extends TypeAdapter<ThemeMode> {
  @override
  final typeId = 0;

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
  final typeId = 1;

  @override
  SettingsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingsModel(
      isSentryEnabled: fields[3] as bool,
      isHideOnStartup: fields[4] as bool,
      isLaunchOnStartup: fields[8] as bool,
      themeMode: fields[5] as ThemeMode,
    );
  }

  @override
  void write(BinaryWriter writer, SettingsModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(3)
      ..write(obj.isSentryEnabled)
      ..writeByte(4)
      ..write(obj.isHideOnStartup)
      ..writeByte(5)
      ..write(obj.themeMode)
      ..writeByte(8)
      ..write(obj.isLaunchOnStartup);
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
  final typeId = 2;

  @override
  IntroSettingsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IntroSettingsModel(alreadyViewed: fields[0] as bool);
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
  final typeId = 3;

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
      createdAt: fields[9] as String,
      updatedAt: fields[10] as String,
      isRCloneBackend: fields[11] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, DriveProviderModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(6)
      ..write(obj.remoteName)
      ..writeByte(7)
      ..write(obj.provider)
      ..writeByte(8)
      ..write(obj.backend)
      ..writeByte(9)
      ..write(obj.createdAt)
      ..writeByte(10)
      ..write(obj.updatedAt)
      ..writeByte(11)
      ..write(obj.isRCloneBackend);
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

class OAuth2Adapter extends TypeAdapter<OAuth2> {
  @override
  final typeId = 5;

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
      $type: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, OAuth2 obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.accessToken)
      ..writeByte(2)
      ..write(obj.refreshToken)
      ..writeByte(3)
      ..write(obj.expiresIn)
      ..writeByte(4)
      ..write(obj.authJson)
      ..writeByte(5)
      ..write(obj.$type);
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
  final typeId = 6;

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
      $type: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, S3 obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.accessKeyId)
      ..writeByte(2)
      ..write(obj.secretAccessKey)
      ..writeByte(3)
      ..write(obj.$type);
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
  final typeId = 7;

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
      $type: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Webdav obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.user)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.$type);
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
  final typeId = 11;

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
      remoteParentPath: fields[7] as String?,
      isAutoSync: fields[4] as bool,
      isDeletionEnabled: fields[5] as bool,
      isTwoWaySync: fields[6] as bool,
      folderId: fields[9] as String?,
      isRCloneBackend: fields[11] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, FolderModel obj) {
    writer
      ..writeByte(10)
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
      ..write(obj.remoteParentPath)
      ..writeByte(9)
      ..write(obj.folderId)
      ..writeByte(11)
      ..write(obj.isRCloneBackend);
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
  final typeId = 12;

  @override
  UserPassword read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserPassword(
      username: fields[0] as String,
      password: fields[1] as String,
      $type: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserPassword obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.password)
      ..writeByte(2)
      ..write(obj.$type);
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

class WorkflowModelAdapter extends TypeAdapter<WorkflowModel> {
  @override
  final typeId = 21;

  @override
  WorkflowModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkflowModel(
      name: fields[0] as String,
      workflowJson: fields[1] as String?,
      nodeType: fields[2] as WorkflowNode,
      linkType: fields[3] as WorkflowOperation,
    );
  }

  @override
  void write(BinaryWriter writer, WorkflowModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.workflowJson)
      ..writeByte(2)
      ..write(obj.nodeType)
      ..writeByte(3)
      ..write(obj.linkType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkflowModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FolderHashModelAdapter extends TypeAdapter<FolderHashModel> {
  @override
  final typeId = 22;

  @override
  FolderHashModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FolderHashModel(
      remoteName: fields[0] as String,
      hash: fields[1] as HashDigest,
    );
  }

  @override
  void write(BinaryWriter writer, FolderHashModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.remoteName)
      ..writeByte(1)
      ..write(obj.hash);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FolderHashModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HashDigestAdapter extends TypeAdapter<HashDigest> {
  @override
  final typeId = 23;

  @override
  HashDigest read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HashDigest(fields[0] as Uint8List);
  }

  @override
  void write(BinaryWriter writer, HashDigest obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.bytes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HashDigestAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OneDriveProviderAdapter extends TypeAdapter<OneDriveProvider> {
  @override
  final typeId = 24;

  @override
  OneDriveProvider read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OneDriveProvider($type: fields[0] as String?);
  }

  @override
  void write(BinaryWriter writer, OneDriveProvider obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.$type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OneDriveProviderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GoogleDriveProviderAdapter extends TypeAdapter<GoogleDriveProvider> {
  @override
  final typeId = 25;

  @override
  GoogleDriveProvider read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GoogleDriveProvider($type: fields[0] as String?);
  }

  @override
  void write(BinaryWriter writer, GoogleDriveProvider obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.$type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GoogleDriveProviderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DropBoxProviderAdapter extends TypeAdapter<DropBoxProvider> {
  @override
  final typeId = 26;

  @override
  DropBoxProvider read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DropBoxProvider($type: fields[0] as String?);
  }

  @override
  void write(BinaryWriter writer, DropBoxProvider obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.$type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DropBoxProviderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProtonDriveProviderAdapter extends TypeAdapter<ProtonDriveProvider> {
  @override
  final typeId = 27;

  @override
  ProtonDriveProvider read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProtonDriveProvider($type: fields[0] as String?);
  }

  @override
  void write(BinaryWriter writer, ProtonDriveProvider obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.$type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProtonDriveProviderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MinioProviderAdapter extends TypeAdapter<MinioProvider> {
  @override
  final typeId = 28;

  @override
  MinioProvider read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MinioProvider($type: fields[0] as String?);
  }

  @override
  void write(BinaryWriter writer, MinioProvider obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.$type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MinioProviderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NextCloudProviderAdapter extends TypeAdapter<NextCloudProvider> {
  @override
  final typeId = 29;

  @override
  NextCloudProvider read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NextCloudProvider($type: fields[0] as String?);
  }

  @override
  void write(BinaryWriter writer, NextCloudProvider obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.$type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NextCloudProviderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LocalProviderAdapter extends TypeAdapter<LocalProvider> {
  @override
  final typeId = 30;

  @override
  LocalProvider read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalProvider($type: fields[0] as String?);
  }

  @override
  void write(BinaryWriter writer, LocalProvider obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.$type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalProviderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LocalAdapter extends TypeAdapter<Local> {
  @override
  final typeId = 31;

  @override
  Local read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Local(folderPath: fields[0] as String, $type: fields[1] as String?);
  }

  @override
  void write(BinaryWriter writer, Local obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.folderPath)
      ..writeByte(1)
      ..write(obj.$type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
