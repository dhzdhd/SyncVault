import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:hashlib/random.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/controllers/folder_controller.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/src/common/utils/associations.dart';
import 'package:syncvault/src/home/models/connection_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syncvault/src/common/services/hive_storage.dart';
import 'package:syncvault/src/home/models/drive_provider.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';
import 'package:syncvault/src/home/models/folder_hash_model.dart';
import 'package:syncvault/src/home/services/file_comparer.dart';
import 'package:syncvault/src/home/services/rclone.dart';

part 'connection_controller.g.dart';

final _connectionBox = GetIt.I<Box<ConnectionModel>>();
final _hashBox = GetIt.I<Box<FolderHashModel>>();
// TODO: Make fetchable from GetIt
final _connectionStorage = HiveStorage<ConnectionModel>(_connectionBox);

@riverpod
class SyncController extends _$SyncController {
  @override
  FutureOr<void> build() {}

  Future<void> sync_(ConnectionModel connectionModel) async {
    final connectionNotifier = ref.read(connectionProvider.notifier);

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => connectionNotifier.uniSync(connectionModel),
    );
  }
}

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

    await _connectionStorage.update(state);
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

    await _connectionStorage.update(state);
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

    await _connectionStorage.update(state);
  }

  Future<void> create({
    required String title,
    required FolderModel firstFolder,
    required FolderModel secondFolder,
    required SyncDirection direction,
  }) async {
    final connection = ConnectionModel(
      id: uuid.v4(),
      title: title,
      firstFolderId: firstFolder.id,
      secondFolderId: secondFolder.id,
      direction: direction,
      isAutoSync: false,
      isDeletionEnabled: false,
    );

    state = [...state, connection];
    await _connectionStorage.update(state);
  }

  Future<void> uniSync(ConnectionModel connectionModel) async {
    final providers = ref.read(authProvider).requireValue;
    final folders = ref.read(folderProvider);

    final (
      firstFolder,
      firstProvider,
      secondFolder,
      secondProvider,
    ) = Option.Do(($) {
      final firstFolder = $(
        folders
            .filter((t) => t.id == connectionModel.firstFolderId)
            .firstOption,
      );
      final secondFolder = $(
        folders
            .filter((t) => t.id == connectionModel.secondFolderId)
            .firstOption,
      );

      final firstProvider = $(getProviderFromFolder(providers, firstFolder));
      final secondProvider = $(getProviderFromFolder(providers, secondFolder));

      return (firstFolder, firstProvider, secondFolder, secondProvider);
    }).toNullable()!;

    final isValid = switch ((firstProvider, secondProvider)) {
      (
        RemoteProviderModel(isRCloneBackend: final first),
        RemoteProviderModel(isRCloneBackend: final second),
      )
          when !(first && second) =>
        false,
      (LocalProviderModel(), LocalProviderModel()) => false,
      _ => true,
    };

    if (isValid) {
      final isRClone = [
        firstProvider,
        secondProvider,
      ].any((model) => model is RemoteProviderModel && model.isRCloneBackend);

      final service = switch (isRClone) {
        true => RCloneSyncService(),
        false => switch ((firstProvider, secondProvider)) {
          (_, RemoteProviderModel(:final provider)) ||
          (RemoteProviderModel(:final provider), _) => switch (provider) {
            GoogleDriveProvider() => throw UnimplementedError(),
            _ => throw UnimplementedError(),
          },
          _ => throw UnimplementedError(),
        },
      };

      await service
          .sync_(
            connectionModel: connectionModel,
            firstFolder: firstFolder,
            firstProvider: firstProvider,
            secondFolder: secondFolder,
            secondProvider: secondProvider,
          )
          .run();
    }

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
