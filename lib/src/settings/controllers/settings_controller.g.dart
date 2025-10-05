// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$permissionsHash() => r'f0c5bb3a3b4494c6df2cd44c5519f8a9344b0c50';

/// See also [permissions].
@ProviderFor(permissions)
final permissionsProvider =
    AutoDisposeFutureProvider<PermissionsModel>.internal(
      permissions,
      name: r'permissionsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$permissionsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PermissionsRef = AutoDisposeFutureProviderRef<PermissionsModel>;
String _$settingsHash() => r'86904457d4fd117734e097108eea58c575b0b06c';

/// See also [Settings].
@ProviderFor(Settings)
final settingsProvider =
    AutoDisposeAsyncNotifierProvider<Settings, SettingsModel>.internal(
      Settings.new,
      name: r'settingsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$settingsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$Settings = AutoDisposeAsyncNotifier<SettingsModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
