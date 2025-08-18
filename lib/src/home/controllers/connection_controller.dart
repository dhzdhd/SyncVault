import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/helpers.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/controllers/folder_controller.dart';
import 'package:syncvault/src/home/models/connection_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syncvault/src/common/services/hive_storage.dart';
import 'package:syncvault/src/home/models/folder_hash_model.dart';
import 'package:syncvault/src/home/services/file_comparer.dart';
import 'package:syncvault/src/home/services/rclone.dart';

part 'connection_controller.g.dart';

final _connectionBox = GetIt.I<Box<ConnectionModel>>();
final _hashBox = GetIt.I<Box<FolderHashModel>>();
// TODO: Make fetchable from GetIt
final _connectionStorage = HiveStorage<ConnectionModel>(_connectionBox);

@riverpod
class Connection extends _$Connection {
  final _hashStorage = HiveStorage<FolderHashModel>(_hashBox);
  final _fileComparer = FileComparer();

  @override
  List<ConnectionModel> build() {
    return init();
  }

  static List<ConnectionModel> init() {
    return _connectionStorage.fetchAll().toList();
  }

  Future<void> toggleAutoSync(ConnectionModel model) async {
    final index = state.indexOf(model);
    state = [
      ...state
        ..remove(model)
        ..insert(index, model.copyWith(isAutoSync: !model.isAutoSync)),
    ];

    _connectionStorage.update(state);
  }

  Future<void> toggleDeletionOnSync(ConnectionModel model) async {
    final index = state.indexOf(model);
    state = [
      ...state
        ..remove(model)
        ..insert(
          index,
          model.copyWith(isDeletionEnabled: !model.isDeletionEnabled),
        ),
    ];

    _connectionStorage.update(state);
  }

  Future<void> changeDirection(
    ConnectionModel model,
    SyncDirection direction,
  ) async {
    final index = state.indexOf(model);
    state = [
      ...state
        ..remove(model)
        ..insert(index, model.copyWith(direction: direction)),
    ];

    _connectionStorage.update(state);
  }

  Future<void> uniSync(
    ConnectionModel connectionModel,
    Option<String> filePath,
  ) async {
    final providerModels = ref.read(authProvider).requireValue;
    final folders = ref.read(folderProvider);

    final firstFolder = folders
        .filter((t) => t.id == connectionModel.firstFolderId)
        .firstOption;
    final secondFolder = folders
        .filter((t) => t.id == connectionModel.secondFolderId)
        .firstOption;

    // If provider is local ignore
    // final firstProviderModel = providerModels.filter((t) => t.remoteName == firstFolder.toNullable())

    // await RCloneDriveService()
    //     .upload(
    //       providerModel: providerModel,
    //       connectionModel: connectionModel,
    //       localPath: connectionModel.title,
    //     )
    //     .run();

    // if (PlatformExtension.isMobile) {
    //   final files = await Directory(
    //     connectionModel.title,
    //   ).list(recursive: true).toList();
    //   final hashResult = await _fileComparer
    //       .calcHash(files.whereType<File>().toList())
    //       .run();
    //   hashResult.match(
    //     (err) =>
    //         GeneralError('Hashes do not match', err.message, err.stackTrace),
    //     (hash) {
    //       final hashModels = _hashStorage.fetchAll().toList();
    //       final model = FolderHashModel(
    //         hash: hash,
    //         remoteName: connectionModel.firstRemote,
    //       );
    //       _hashStorage.update(
    //         hashModels
    //           ..removeWhere((e) => e.remoteName == model.remoteName)
    //           ..add(model),
    //       );
    //     },
    //   );
    // }

    // TODO: Implement per file
  }

  Future<void> delete(ConnectionModel model, bool deleteRemote) async {
    state = state.where((element) => element != model).toList();
    await _connectionStorage.update(state);
  }

  Future<void> clearCache() async {
    state = [];
    await _connectionStorage.clear();
  }
}
