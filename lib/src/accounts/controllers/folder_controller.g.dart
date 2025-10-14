// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CreateFolderController)
const createFolderControllerProvider = CreateFolderControllerProvider._();

final class CreateFolderControllerProvider
    extends $AsyncNotifierProvider<CreateFolderController, void> {
  const CreateFolderControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createFolderControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createFolderControllerHash();

  @$internal
  @override
  CreateFolderController create() => CreateFolderController();
}

String _$createFolderControllerHash() =>
    r'b3846ff820cf0d106b980f0548eb80fbbb35daa3';

abstract class _$CreateFolderController extends $AsyncNotifier<void> {
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

@ProviderFor(DeleteFolderController)
const deleteFolderControllerProvider = DeleteFolderControllerProvider._();

final class DeleteFolderControllerProvider
    extends $AsyncNotifierProvider<DeleteFolderController, void> {
  const DeleteFolderControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteFolderControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteFolderControllerHash();

  @$internal
  @override
  DeleteFolderController create() => DeleteFolderController();
}

String _$deleteFolderControllerHash() =>
    r'a9eb332480f4255177b939c6a366cde04da7dd6d';

abstract class _$DeleteFolderController extends $AsyncNotifier<void> {
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

@ProviderFor(treeView)
const treeViewProvider = TreeViewFamily._();

final class TreeViewProvider
    extends
        $FunctionalProvider<
          AsyncValue<Option<FileModel>>,
          Option<FileModel>,
          FutureOr<Option<FileModel>>
        >
    with
        $FutureModifier<Option<FileModel>>,
        $FutureProvider<Option<FileModel>> {
  const TreeViewProvider._({
    required TreeViewFamily super.from,
    required (Option<FolderModel>, DriveProviderModel) super.argument,
  }) : super(
         retry: null,
         name: r'treeViewProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$treeViewHash();

  @override
  String toString() {
    return r'treeViewProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<Option<FileModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Option<FileModel>> create(Ref ref) {
    final argument = this.argument as (Option<FolderModel>, DriveProviderModel);
    return treeView(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is TreeViewProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$treeViewHash() => r'b55ade1105e19faf2fe9bc038432867f757906e5';

final class TreeViewFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<Option<FileModel>>,
          (Option<FolderModel>, DriveProviderModel)
        > {
  const TreeViewFamily._()
    : super(
        retry: null,
        name: r'treeViewProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TreeViewProvider call(
    Option<FolderModel> folderModel,
    DriveProviderModel providerModel,
  ) => TreeViewProvider._(argument: (folderModel, providerModel), from: this);

  @override
  String toString() => r'treeViewProvider';
}

@ProviderFor(ListView)
const listViewProvider = ListViewFamily._();

final class ListViewProvider
    extends $AsyncNotifierProvider<ListView, List<FileModel>> {
  const ListViewProvider._({
    required ListViewFamily super.from,
    required (DriveProviderModel, String) super.argument,
  }) : super(
         retry: null,
         name: r'listViewProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$listViewHash();

  @override
  String toString() {
    return r'listViewProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  ListView create() => ListView();

  @override
  bool operator ==(Object other) {
    return other is ListViewProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$listViewHash() => r'76fa236abe97aad2379a0f99044e3fc1954280f2';

final class ListViewFamily extends $Family
    with
        $ClassFamilyOverride<
          ListView,
          AsyncValue<List<FileModel>>,
          List<FileModel>,
          FutureOr<List<FileModel>>,
          (DriveProviderModel, String)
        > {
  const ListViewFamily._()
    : super(
        retry: null,
        name: r'listViewProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ListViewProvider call(DriveProviderModel providerModel, String path) =>
      ListViewProvider._(argument: (providerModel, path), from: this);

  @override
  String toString() => r'listViewProvider';
}

abstract class _$ListView extends $AsyncNotifier<List<FileModel>> {
  late final _$args = ref.$arg as (DriveProviderModel, String);
  DriveProviderModel get providerModel => _$args.$1;
  String get path => _$args.$2;

  FutureOr<List<FileModel>> build(
    DriveProviderModel providerModel,
    String path,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args.$1, _$args.$2);
    final ref = this.ref as $Ref<AsyncValue<List<FileModel>>, List<FileModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<FileModel>>, List<FileModel>>,
              AsyncValue<List<FileModel>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(Folder)
const folderProvider = FolderProvider._();

final class FolderProvider
    extends $NotifierProvider<Folder, List<FolderModel>> {
  const FolderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'folderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$folderHash();

  @$internal
  @override
  Folder create() => Folder();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<FolderModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<FolderModel>>(value),
    );
  }
}

String _$folderHash() => r'88e4fcd481a8b06de3c86e93d59326f1cdb55b0b';

abstract class _$Folder extends $Notifier<List<FolderModel>> {
  List<FolderModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<FolderModel>, List<FolderModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<FolderModel>, List<FolderModel>>,
              List<FolderModel>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
