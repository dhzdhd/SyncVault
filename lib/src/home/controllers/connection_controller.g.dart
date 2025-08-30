// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$syncControllerHash() => r'5b52fed9e6c2b7a3bb1cd8cb7925235a4e3aa9de';

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
String _$connectionHash() => r'c9bd8b0d18d92668fb080d4a8d852399329fbd8f';

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
