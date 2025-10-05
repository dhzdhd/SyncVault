// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$syncControllerHash() => r'57eb163e69a2124745fc71501bd7f91e1a7d8bbd';

/// See also [SyncController].
@ProviderFor(SyncController)
final syncControllerProvider =
    AutoDisposeAsyncNotifierProvider<
      SyncController,
      Either<AppError, Option<ProgressModel>>
    >.internal(
      SyncController.new,
      name: r'syncControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$syncControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SyncController =
    AutoDisposeAsyncNotifier<Either<AppError, Option<ProgressModel>>>;
String _$connectionHash() => r'3e86d308864fbbf59ee3458e1906844ab67a732e';

/// See also [Connection].
@ProviderFor(Connection)
final connectionProvider =
    AutoDisposeNotifierProvider<Connection, List<ConnectionModel>>.internal(
      Connection.new,
      name: r'connectionProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$connectionHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$Connection = AutoDisposeNotifier<List<ConnectionModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
