// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intro_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RCloneDownloadController)
const rCloneDownloadControllerProvider = RCloneDownloadControllerProvider._();

final class RCloneDownloadControllerProvider
    extends $AsyncNotifierProvider<RCloneDownloadController, int> {
  const RCloneDownloadControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rCloneDownloadControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rCloneDownloadControllerHash();

  @$internal
  @override
  RCloneDownloadController create() => RCloneDownloadController();
}

String _$rCloneDownloadControllerHash() =>
    r'b87325523c8dbdfa8419af85b75a33d9cd10b101';

abstract class _$RCloneDownloadController extends $AsyncNotifier<int> {
  FutureOr<int> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<int>, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<int>, int>,
              AsyncValue<int>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(IntroSettings)
const introSettingsProvider = IntroSettingsProvider._();

final class IntroSettingsProvider
    extends $NotifierProvider<IntroSettings, IntroSettingsModel> {
  const IntroSettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'introSettingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$introSettingsHash();

  @$internal
  @override
  IntroSettings create() => IntroSettings();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IntroSettingsModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IntroSettingsModel>(value),
    );
  }
}

String _$introSettingsHash() => r'a46b4528d139006372a8917a53f33d49caec8133';

abstract class _$IntroSettings extends $Notifier<IntroSettingsModel> {
  IntroSettingsModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<IntroSettingsModel, IntroSettingsModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<IntroSettingsModel, IntroSettingsModel>,
              IntroSettingsModel,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
