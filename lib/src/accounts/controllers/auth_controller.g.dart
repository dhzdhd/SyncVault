// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthController)
const authControllerProvider = AuthControllerProvider._();

final class AuthControllerProvider
    extends $AsyncNotifierProvider<AuthController, void> {
  const AuthControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authControllerHash();

  @$internal
  @override
  AuthController create() => AuthController();
}

String _$authControllerHash() => r'2729c5e63ac1c6eb326b90bc83d03058a2996ebb';

abstract class _$AuthController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}

@ProviderFor(driveInfoController)
const driveInfoControllerProvider = DriveInfoControllerFamily._();

final class DriveInfoControllerProvider
    extends
        $FunctionalProvider<
          AsyncValue<DriveInfoModel>,
          DriveInfoModel,
          FutureOr<DriveInfoModel>
        >
    with $FutureModifier<DriveInfoModel>, $FutureProvider<DriveInfoModel> {
  const DriveInfoControllerProvider._({
    required DriveInfoControllerFamily super.from,
    required DriveProviderModel super.argument,
  }) : super(
         retry: null,
         name: r'driveInfoControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$driveInfoControllerHash();

  @override
  String toString() {
    return r'driveInfoControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<DriveInfoModel> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<DriveInfoModel> create(Ref ref) {
    final argument = this.argument as DriveProviderModel;
    return driveInfoController(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is DriveInfoControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$driveInfoControllerHash() =>
    r'd64cf2eb4fdae981c745650d7bae50e588c15f3c';

final class DriveInfoControllerFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<DriveInfoModel>,
          DriveProviderModel
        > {
  const DriveInfoControllerFamily._()
    : super(
        retry: null,
        name: r'driveInfoControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DriveInfoControllerProvider call(DriveProviderModel model) =>
      DriveInfoControllerProvider._(argument: model, from: this);

  @override
  String toString() => r'driveInfoControllerProvider';
}

@ProviderFor(Auth)
const authProvider = AuthProvider._();

final class AuthProvider
    extends $AsyncNotifierProvider<Auth, List<DriveProviderModel>> {
  const AuthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authHash();

  @$internal
  @override
  Auth create() => Auth();
}

String _$authHash() => r'5764f404fc3f9def6a7fef296cdca7eb4837c079';

abstract class _$Auth extends $AsyncNotifier<List<DriveProviderModel>> {
  FutureOr<List<DriveProviderModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<DriveProviderModel>>,
              List<DriveProviderModel>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<DriveProviderModel>>,
                List<DriveProviderModel>
              >,
              AsyncValue<List<DriveProviderModel>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
