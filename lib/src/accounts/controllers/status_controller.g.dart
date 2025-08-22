// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$connectionStatusHash() => r'e70d82187e7ef0c58c24cf9bfcf865f887d8431d';

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

/// See also [connectionStatus].
@ProviderFor(connectionStatus)
const connectionStatusProvider = ConnectionStatusFamily();

/// See also [connectionStatus].
class ConnectionStatusFamily extends Family<AsyncValue<bool>> {
  /// See also [connectionStatus].
  const ConnectionStatusFamily();

  /// See also [connectionStatus].
  ConnectionStatusProvider call(InvalidType model) {
    return ConnectionStatusProvider(model);
  }

  @override
  ConnectionStatusProvider getProviderOverride(
    covariant ConnectionStatusProvider provider,
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
  String? get name => r'connectionStatusProvider';
}

/// See also [connectionStatus].
class ConnectionStatusProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [connectionStatus].
  ConnectionStatusProvider(InvalidType model)
    : this._internal(
        (ref) => connectionStatus(ref as ConnectionStatusRef, model),
        from: connectionStatusProvider,
        name: r'connectionStatusProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$connectionStatusHash,
        dependencies: ConnectionStatusFamily._dependencies,
        allTransitiveDependencies:
            ConnectionStatusFamily._allTransitiveDependencies,
        model: model,
      );

  ConnectionStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.model,
  }) : super.internal();

  final InvalidType model;

  @override
  Override overrideWith(
    FutureOr<bool> Function(ConnectionStatusRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ConnectionStatusProvider._internal(
        (ref) => create(ref as ConnectionStatusRef),
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
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _ConnectionStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ConnectionStatusProvider && other.model == model;
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
mixin ConnectionStatusRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `model` of this provider.
  InvalidType get model;
}

class _ConnectionStatusProviderElement
    extends AutoDisposeFutureProviderElement<bool>
    with ConnectionStatusRef {
  _ConnectionStatusProviderElement(super.provider);

  @override
  InvalidType get model => (origin as ConnectionStatusProvider).model;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
