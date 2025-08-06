import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hashlib/hashlib.dart';
import 'package:hive_ce/hive.dart';
import 'package:syncvault/src/accounts/models/connection_model.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/src/home/models/drive_provider.dart';
import 'package:syncvault/src/workflows/models/workflow_model.dart';
import 'package:syncvault/src/home/models/drive_provider_backend.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';
import 'package:syncvault/src/home/models/folder_hash_model.dart';
import 'package:syncvault/src/introduction/models/intro_model.dart';
import 'package:syncvault/src/settings/models/settings_model.dart';
import 'package:syncvault/src/workflows/models/workflow_type.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([
  AdapterSpec<SettingsModel>(),
  AdapterSpec<ThemeMode>(),
  AdapterSpec<IntroSettingsModel>(),
  AdapterSpec<DriveProviderModel>(),
  AdapterSpec<OneDriveProvider>(),
  AdapterSpec<GoogleDriveProvider>(),
  AdapterSpec<DropBoxProvider>(),
  AdapterSpec<ProtonDriveProvider>(),
  AdapterSpec<MinioProvider>(),
  AdapterSpec<NextCloudProvider>(),
  AdapterSpec<LocalProvider>(),
  AdapterSpec<OAuth2>(),
  AdapterSpec<S3>(),
  AdapterSpec<Webdav>(),
  AdapterSpec<UserPassword>(),
  AdapterSpec<Local>(),
  AdapterSpec<ConnectionModel>(),
  AdapterSpec<WorkflowModel>(),
  AdapterSpec<FolderModel>(),
  AdapterSpec<FolderHashModel>(),
  AdapterSpec<HashDigest>(),
])
class HiveAdapters {}
