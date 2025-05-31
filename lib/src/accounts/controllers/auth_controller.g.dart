// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$driveInfoControllerHash() =>
    r'd64cf2eb4fdae981c745650d7bae50e588c15f3c';

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
class DriveInfoControllerFamily extends Family<AsyncValue<DriveInfoModel>> {
  /// See also [driveInfoController].
  const DriveInfoControllerFamily();

  /// See also [driveInfoController].
  DriveInfoControllerProvider call(DriveProviderModel model) {
    return DriveInfoControllerProvider(model);
  }

  @override
  DriveInfoControllerProvider getProviderOverride(
    covariant DriveInfoControllerProvider provider,
  ) {
    return call(provider.model);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'driveInfoControllerProvider';
}

/// See also [driveInfoController].
class DriveInfoControllerProvider
    extends AutoDisposeFutureProvider<DriveInfoModel> {
  /// See also [driveInfoController].
  DriveInfoControllerProvider(DriveProviderModel model)
    : this._internal(
        (ref) => driveInfoController(ref as DriveInfoControllerRef, model),
        from: driveInfoControllerProvider,
        name: r'driveInfoControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$driveInfoControllerHash,
        dependencies: DriveInfoControllerFamily._dependencies,
        allTransitiveDependencies:
            DriveInfoControllerFamily._allTransitiveDependencies,
        model: model,
      );

  DriveInfoControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.model,
  }) : super.internal();

  final DriveProviderModel model;

  @override
  Override overrideWith(
    FutureOr<DriveInfoModel> Function(DriveInfoControllerRef provider) create,
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
  AutoDisposeFutureProviderElement<DriveInfoModel> createElement() {
    return _DriveInfoControllerProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DriveInfoControllerRef on AutoDisposeFutureProviderRef<DriveInfoModel> {
  /// The parameter `model` of this provider.
  DriveProviderModel get model;
}

class _DriveInfoControllerProviderElement
    extends AutoDisposeFutureProviderElement<DriveInfoModel>
    with DriveInfoControllerRef {
  _DriveInfoControllerProviderElement(super.provider);

  @override
  DriveProviderModel get model => (origin as DriveInfoControllerProvider).model;
}

String _$authControllerHash() => r'2729c5e63ac1c6eb326b90bc83d03058a2996ebb';

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
String _$authHash() => r'0aaca8789ca8a8bcd50f395f171eefb398ca574c';

/// See also [Auth].
@ProviderFor(Auth)
final authProvider =
    AutoDisposeAsyncNotifierProvider<Auth, List<DriveProviderModel>>.internal(
      Auth.new,
      name: r'authProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$authHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$Auth = AutoDisposeAsyncNotifier<List<DriveProviderModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
