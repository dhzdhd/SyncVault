// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$driveInfoControllerHash() =>
    r'c53138202c6a43d5887c7a2e0a571b336658a4b3';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [driveInfoController].
@ProviderFor(driveInfoController)
const driveInfoControllerProvider = DriveInfoControllerFamily();

/// See also [driveInfoController].
class DriveInfoControllerFamily extends Family {
  /// See also [driveInfoController].
  const DriveInfoControllerFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'driveInfoControllerProvider';

  /// See also [driveInfoController].
  DriveInfoControllerProvider call(
    AuthProviderModel model,
  ) {
    return DriveInfoControllerProvider(
      model,
    );
  }

  @visibleForOverriding
  @override
  DriveInfoControllerProvider getProviderOverride(
    covariant DriveInfoControllerProvider provider,
  ) {
    return call(
      provider.model,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<DriveInfoModel> Function(DriveInfoControllerRef ref) create) {
    return _$DriveInfoControllerFamilyOverride(this, create);
  }
}

class _$DriveInfoControllerFamilyOverride implements FamilyOverride {
  _$DriveInfoControllerFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<DriveInfoModel> Function(DriveInfoControllerRef ref) create;

  @override
  final DriveInfoControllerFamily overriddenFamily;

  @override
  DriveInfoControllerProvider getProviderOverride(
    covariant DriveInfoControllerProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// See also [driveInfoController].
class DriveInfoControllerProvider
    extends AutoDisposeFutureProvider<DriveInfoModel> {
  /// See also [driveInfoController].
  DriveInfoControllerProvider(
    AuthProviderModel model,
  ) : this._internal(
          (ref) => driveInfoController(
            ref as DriveInfoControllerRef,
            model,
          ),
          from: driveInfoControllerProvider,
          name: r'driveInfoControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$driveInfoControllerHash,
          dependencies: DriveInfoControllerFamily._dependencies,
          allTransitiveDependencies:
              DriveInfoControllerFamily._allTransitiveDependencies,
          model: model,
        );

  DriveInfoControllerProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.model,
  }) : super.internal();

  final AuthProviderModel model;

  @override
  Override overrideWith(
    FutureOr<DriveInfoModel> Function(DriveInfoControllerRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DriveInfoControllerProvider._internal(
        (ref) => create(ref as DriveInfoControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        model: model,
      ),
    );
  }

  @override
  (AuthProviderModel,) get argument {
    return (model,);
  }

  @override
  AutoDisposeFutureProviderElement<DriveInfoModel> createElement() {
    return _DriveInfoControllerProviderElement(this);
  }

  DriveInfoControllerProvider _copyWith(
    FutureOr<DriveInfoModel> Function(DriveInfoControllerRef ref) create,
  ) {
    return DriveInfoControllerProvider._internal(
      (ref) => create(ref as DriveInfoControllerRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      model: model,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DriveInfoControllerProvider && other.model == model;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, model.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DriveInfoControllerRef on AutoDisposeFutureProviderRef<DriveInfoModel> {
  /// The parameter `model` of this provider.
  AuthProviderModel get model;
}

class _DriveInfoControllerProviderElement
    extends AutoDisposeFutureProviderElement<DriveInfoModel>
    with DriveInfoControllerRef {
  _DriveInfoControllerProviderElement(super.provider);

  @override
  AuthProviderModel get model => (origin as DriveInfoControllerProvider).model;
}

String _$authControllerHash() => r'1a450cb08f9c89ad4612d36261cb94ab4ab973a8';

/// See also [AuthController].
@ProviderFor(AuthController)
final authControllerProvider =
    AutoDisposeAsyncNotifierProvider<AuthController, void>.internal(
  AuthController.new,
  name: r'authControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthController = AutoDisposeAsyncNotifier<void>;
String _$authHash() => r'e5d40b1393ea4cdf79aad848b6cdc9cfbf7240e7';

/// See also [Auth].
@ProviderFor(Auth)
final authProvider =
    AutoDisposeNotifierProvider<Auth, List<AuthProviderModel>>.internal(
  Auth.new,
  name: r'authProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Auth = AutoDisposeNotifier<List<AuthProviderModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
