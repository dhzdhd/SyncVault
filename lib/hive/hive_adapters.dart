import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/src/home/models/drive_provider_backend.dart';
import 'package:syncvault/src/home/models/drive_provider_backend_payload.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';
import 'package:syncvault/src/home/services/rclone.dart';
import 'package:syncvault/src/introduction/models/intro_model.dart';
import 'package:syncvault/src/settings/models/settings_model.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([
  AdapterSpec<SettingsModel>(),
  AdapterSpec<ThemeMode>(),
  AdapterSpec<IntroSettingsModel>(),
  AdapterSpec<DriveProviderModel>(),
  AdapterSpec<DriveProvider>(),
  AdapterSpec<OAuth2>(),
  AdapterSpec<S3>(),
  AdapterSpec<Webdav>(),
  AdapterSpec<OAuth2Payload>(),
  AdapterSpec<S3Payload>(),
  AdapterSpec<WebdavPayload>(),
  AdapterSpec<FolderModel>()
])
class HiveAdapters {}
