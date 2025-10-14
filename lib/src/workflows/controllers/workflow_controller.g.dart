// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workflow_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WorkflowController)
const workflowControllerProvider = WorkflowControllerProvider._();

final class WorkflowControllerProvider
    extends $AsyncNotifierProvider<WorkflowController, void> {
  const WorkflowControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'workflowControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$workflowControllerHash();

  @$internal
  @override
  WorkflowController create() => WorkflowController();
}

String _$workflowControllerHash() =>
    r'5c735142c6abeb5e447ff714130f159c6bc8b5a7';

abstract class _$WorkflowController extends $AsyncNotifier<void> {
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

@ProviderFor(Workflow)
const workflowProvider = WorkflowProvider._();

final class WorkflowProvider
    extends $NotifierProvider<Workflow, List<WorkflowModel>> {
  const WorkflowProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'workflowProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$workflowHash();

  @$internal
  @override
  Workflow create() => Workflow();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<WorkflowModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<WorkflowModel>>(value),
    );
  }
}

String _$workflowHash() => r'5942ba997a8c593030238c859b51b3f90569fd1a';

abstract class _$Workflow extends $Notifier<List<WorkflowModel>> {
  List<WorkflowModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<WorkflowModel>, List<WorkflowModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<WorkflowModel>, List<WorkflowModel>>,
              List<WorkflowModel>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
