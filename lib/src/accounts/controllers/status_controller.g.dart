// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(connectionStatus)
const connectionStatusProvider = ConnectionStatusFamily._();

final class ConnectionStatusProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  const ConnectionStatusProvider._({
    required ConnectionStatusFamily super.from,
    required DriveProviderModel super.argument,
  }) : super(
         retry: null,
         name: r'connectionStatusProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$connectionStatusHash();

  @override
  String toString() {
    return r'connectionStatusProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as DriveProviderModel;
    return connectionStatus(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ConnectionStatusProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$connectionStatusHash() => r'6bb908e5efdf1c81b85db57ce78cbcf7d1e8df10';

final class ConnectionStatusFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<bool>, DriveProviderModel> {
  const ConnectionStatusFamily._()
    : super(
        retry: null,
        name: r'connectionStatusProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ConnectionStatusProvider call(DriveProviderModel model) =>
      ConnectionStatusProvider._(argument: model, from: this);

  @override
  String toString() => r'connectionStatusProvider';
}
