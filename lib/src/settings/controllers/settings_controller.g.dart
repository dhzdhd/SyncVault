// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(permissions)
const permissionsProvider = PermissionsProvider._();

final class PermissionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<PermissionsModel>,
          PermissionsModel,
          FutureOr<PermissionsModel>
        >
    with $FutureModifier<PermissionsModel>, $FutureProvider<PermissionsModel> {
  const PermissionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'permissionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$permissionsHash();

  @$internal
  @override
  $FutureProviderElement<PermissionsModel> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PermissionsModel> create(Ref ref) {
    return permissions(ref);
  }
}

String _$permissionsHash() => r'f0c5bb3a3b4494c6df2cd44c5519f8a9344b0c50';

@ProviderFor(Settings)
const settingsProvider = SettingsProvider._();

final class SettingsProvider
    extends $AsyncNotifierProvider<Settings, SettingsModel> {
  const SettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsHash();

  @$internal
  @override
  Settings create() => Settings();
}

String _$settingsHash() => r'86904457d4fd117734e097108eea58c575b0b06c';

abstract class _$Settings extends $AsyncNotifier<SettingsModel> {
  FutureOr<SettingsModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<SettingsModel>, SettingsModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SettingsModel>, SettingsModel>,
              AsyncValue<SettingsModel>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
