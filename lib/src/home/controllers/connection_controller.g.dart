// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SyncController)
const syncControllerProvider = SyncControllerProvider._();

final class SyncControllerProvider
    extends
        $AsyncNotifierProvider<
          SyncController,
          Either<AppError, Option<ProgressModel>>
        > {
  const SyncControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'syncControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$syncControllerHash();

  @$internal
  @override
  SyncController create() => SyncController();
}

String _$syncControllerHash() => r'57eb163e69a2124745fc71501bd7f91e1a7d8bbd';

abstract class _$SyncController
    extends $AsyncNotifier<Either<AppError, Option<ProgressModel>>> {
  FutureOr<Either<AppError, Option<ProgressModel>>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<Either<AppError, Option<ProgressModel>>>,
              Either<AppError, Option<ProgressModel>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Either<AppError, Option<ProgressModel>>>,
                Either<AppError, Option<ProgressModel>>
              >,
              AsyncValue<Either<AppError, Option<ProgressModel>>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(Connection)
const connectionProvider = ConnectionProvider._();

final class ConnectionProvider
    extends $NotifierProvider<Connection, List<ConnectionModel>> {
  const ConnectionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'connectionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$connectionHash();

  @$internal
  @override
  Connection create() => Connection();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ConnectionModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ConnectionModel>>(value),
    );
  }
}

String _$connectionHash() => r'3e86d308864fbbf59ee3458e1906844ab67a732e';

abstract class _$Connection extends $Notifier<List<ConnectionModel>> {
  List<ConnectionModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<ConnectionModel>, List<ConnectionModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<ConnectionModel>, List<ConnectionModel>>,
              List<ConnectionModel>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
