// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$treeViewHash() => r'b55ade1105e19faf2fe9bc038432867f757906e5';

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
  TreeViewProvider call(
    Option<FolderModel> folderModel,
    DriveProviderModel providerModel,
  ) {
    return TreeViewProvider(folderModel, providerModel);
  }

  @override
  TreeViewProvider getProviderOverride(covariant TreeViewProvider provider) {
    return call(provider.folderModel, provider.providerModel);
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
  TreeViewProvider(
    Option<FolderModel> folderModel,
    DriveProviderModel providerModel,
  ) : this._internal(
        (ref) => treeView(ref as TreeViewRef, folderModel, providerModel),
        from: treeViewProvider,
        name: r'treeViewProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$treeViewHash,
        dependencies: TreeViewFamily._dependencies,
        allTransitiveDependencies: TreeViewFamily._allTransitiveDependencies,
        folderModel: folderModel,
        providerModel: providerModel,
      );

  TreeViewProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.folderModel,
    required this.providerModel,
  }) : super.internal();

  final Option<FolderModel> folderModel;
  final DriveProviderModel providerModel;

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
        providerModel: providerModel,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Option<FileModel>> createElement() {
    return _TreeViewProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TreeViewProvider &&
        other.folderModel == folderModel &&
        other.providerModel == providerModel;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, folderModel.hashCode);
    hash = _SystemHash.combine(hash, providerModel.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TreeViewRef on AutoDisposeFutureProviderRef<Option<FileModel>> {
  /// The parameter `folderModel` of this provider.
  Option<FolderModel> get folderModel;

  /// The parameter `providerModel` of this provider.
  DriveProviderModel get providerModel;
}

class _TreeViewProviderElement
    extends AutoDisposeFutureProviderElement<Option<FileModel>>
    with TreeViewRef {
  _TreeViewProviderElement(super.provider);

  @override
  Option<FolderModel> get folderModel =>
      (origin as TreeViewProvider).folderModel;
  @override
  DriveProviderModel get providerModel =>
      (origin as TreeViewProvider).providerModel;
}

String _$listViewHash() => r'f16c435f706bc18d3a0166849f7073dab7696239';

/// See also [listView].
@ProviderFor(listView)
const listViewProvider = ListViewFamily();

/// See also [listView].
class ListViewFamily extends Family<AsyncValue<List<FileModel>>> {
  /// See also [listView].
  const ListViewFamily();

  /// See also [listView].
  ListViewProvider call(DriveProviderModel providerModel, String path) {
    return ListViewProvider(providerModel, path);
  }

  @override
  ListViewProvider getProviderOverride(covariant ListViewProvider provider) {
    return call(provider.providerModel, provider.path);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'listViewProvider';
}

/// See also [listView].
class ListViewProvider extends AutoDisposeFutureProvider<List<FileModel>> {
  /// See also [listView].
  ListViewProvider(DriveProviderModel providerModel, String path)
    : this._internal(
        (ref) => listView(ref as ListViewRef, providerModel, path),
        from: listViewProvider,
        name: r'listViewProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$listViewHash,
        dependencies: ListViewFamily._dependencies,
        allTransitiveDependencies: ListViewFamily._allTransitiveDependencies,
        providerModel: providerModel,
        path: path,
      );

  ListViewProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.providerModel,
    required this.path,
  }) : super.internal();

  final DriveProviderModel providerModel;
  final String path;

  @override
  Override overrideWith(
    FutureOr<List<FileModel>> Function(ListViewRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListViewProvider._internal(
        (ref) => create(ref as ListViewRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        providerModel: providerModel,
        path: path,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<FileModel>> createElement() {
    return _ListViewProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListViewProvider &&
        other.providerModel == providerModel &&
        other.path == path;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, providerModel.hashCode);
    hash = _SystemHash.combine(hash, path.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ListViewRef on AutoDisposeFutureProviderRef<List<FileModel>> {
  /// The parameter `providerModel` of this provider.
  DriveProviderModel get providerModel;

  /// The parameter `path` of this provider.
  String get path;
}

class _ListViewProviderElement
    extends AutoDisposeFutureProviderElement<List<FileModel>>
    with ListViewRef {
  _ListViewProviderElement(super.provider);

  @override
  DriveProviderModel get providerModel =>
      (origin as ListViewProvider).providerModel;
  @override
  String get path => (origin as ListViewProvider).path;
}

String _$createFolderControllerHash() =>
    r'b3846ff820cf0d106b980f0548eb80fbbb35daa3';

/// See also [CreateFolderController].
@ProviderFor(CreateFolderController)
final createFolderControllerProvider =
    AutoDisposeAsyncNotifierProvider<CreateFolderController, void>.internal(
      CreateFolderController.new,
      name: r'createFolderControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$createFolderControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CreateFolderController = AutoDisposeAsyncNotifier<void>;
String _$deleteFolderControllerHash() =>
    r'a9eb332480f4255177b939c6a366cde04da7dd6d';

/// See also [DeleteFolderController].
@ProviderFor(DeleteFolderController)
final deleteFolderControllerProvider =
    AutoDisposeAsyncNotifierProvider<DeleteFolderController, void>.internal(
      DeleteFolderController.new,
      name: r'deleteFolderControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$deleteFolderControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$DeleteFolderController = AutoDisposeAsyncNotifier<void>;
String _$folderHash() => r'88e4fcd481a8b06de3c86e93d59326f1cdb55b0b';

/// See also [Folder].
@ProviderFor(Folder)
final folderProvider =
    AutoDisposeNotifierProvider<Folder, List<FolderModel>>.internal(
      Folder.new,
      name: r'folderProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$folderHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$Folder = AutoDisposeNotifier<List<FolderModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
