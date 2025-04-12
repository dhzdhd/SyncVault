// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$treeViewHash() => r'db2c11df99380dda253ad536a68c2d46a956cbf8';

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

/// See also [treeView].
@ProviderFor(treeView)
const treeViewProvider = TreeViewFamily();

/// See also [treeView].
class TreeViewFamily extends Family<AsyncValue<Option<FileModel>>> {
  /// See also [treeView].
  const TreeViewFamily();

  /// See also [treeView].
  TreeViewProvider call(FolderModel folderModel) {
    return TreeViewProvider(folderModel);
  }

  @override
  TreeViewProvider getProviderOverride(covariant TreeViewProvider provider) {
    return call(provider.folderModel);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'treeViewProvider';
}

/// See also [treeView].
class TreeViewProvider extends AutoDisposeFutureProvider<Option<FileModel>> {
  /// See also [treeView].
  TreeViewProvider(FolderModel folderModel)
    : this._internal(
        (ref) => treeView(ref as TreeViewRef, folderModel),
        from: treeViewProvider,
        name: r'treeViewProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$treeViewHash,
        dependencies: TreeViewFamily._dependencies,
        allTransitiveDependencies: TreeViewFamily._allTransitiveDependencies,
        folderModel: folderModel,
      );

  TreeViewProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.folderModel,
  }) : super.internal();

  final FolderModel folderModel;

  @override
  Override overrideWith(
    FutureOr<Option<FileModel>> Function(TreeViewRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TreeViewProvider._internal(
        (ref) => create(ref as TreeViewRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        folderModel: folderModel,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Option<FileModel>> createElement() {
    return _TreeViewProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TreeViewProvider && other.folderModel == folderModel;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, folderModel.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TreeViewRef on AutoDisposeFutureProviderRef<Option<FileModel>> {
  /// The parameter `folderModel` of this provider.
  FolderModel get folderModel;
}

class _TreeViewProviderElement
    extends AutoDisposeFutureProviderElement<Option<FileModel>>
    with TreeViewRef {
  _TreeViewProviderElement(super.provider);

  @override
  FolderModel get folderModel => (origin as TreeViewProvider).folderModel;
}

String _$createFolderControllerHash() =>
    r'e4d79b87588b0c115affb54dba657c1c9e0189b8';

/// See also [CreateFolderController].
@ProviderFor(CreateFolderController)
final createFolderControllerProvider =
    AutoDisposeAsyncNotifierProvider<CreateFolderController, void>.internal(
      CreateFolderController.new,
      name: r'createFolderControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$createFolderControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CreateFolderController = AutoDisposeAsyncNotifier<void>;
String _$uploadDeleteControllerHash() =>
    r'120266902bce20929104826f508f50c0eebf402b';

/// See also [UploadDeleteController].
@ProviderFor(UploadDeleteController)
final uploadDeleteControllerProvider =
    AutoDisposeAsyncNotifierProvider<UploadDeleteController, void>.internal(
      UploadDeleteController.new,
      name: r'uploadDeleteControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$uploadDeleteControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$UploadDeleteController = AutoDisposeAsyncNotifier<void>;
String _$folderHash() => r'8c61c886b6c4f99c16565d593d8a01f99715bfc3';

/// See also [Folder].
@ProviderFor(Folder)
final folderProvider =
    AutoDisposeNotifierProvider<Folder, List<FolderModel>>.internal(
      Folder.new,
      name: r'folderProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product') ? null : _$folderHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$Folder = AutoDisposeNotifier<List<FolderModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
