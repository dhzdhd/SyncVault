// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$syncControllerHash() => r'9333dc8decab172982e3d799ff3e73dca1627b0b';

/// See also [SyncController].
@ProviderFor(SyncController)
final syncControllerProvider =
    AutoDisposeAsyncNotifierProvider<SyncController, void>.internal(
      SyncController.new,
      name: r'syncControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$syncControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SyncController = AutoDisposeAsyncNotifier<void>;
String _$connectionHash() => r'73d5a7f4a9ea3697609c3b807d4af3df16df2d16';

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
