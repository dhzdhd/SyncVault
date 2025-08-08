import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/helpers.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/controllers/folder_controller.dart';
import 'package:syncvault/src/common/components/circular_progress_widget.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';

enum SyncDirection { upload, download, bidirectional }

class NewFolderDialogWidget extends StatefulHookConsumerWidget {
  const NewFolderDialogWidget({super.key});

  @override
  ConsumerState<NewFolderDialogWidget> createState() =>
      _NewFolderDialogWidgetState();
}

class _NewFolderDialogWidgetState extends ConsumerState<NewFolderDialogWidget> {
  late final TextEditingController _titleController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final firstSelectedProvider = useState<Option<DriveProviderModel>>(
      const None(),
    );
    final secondSelectedProvider = useState<Option<DriveProviderModel>>(
      const None(),
    );
    final selectedDirection = useState<Set<SyncDirection>>({
      SyncDirection.upload,
    });

    final authInfo = ref.watch(authProvider);
    final createFolderController = ref.watch(createFolderControllerProvider);

    ref.listen<AsyncValue>(createFolderControllerProvider, (prev, state) {
      if (!state.isLoading && state.hasError) {
        context.showErrorSnackBar(
          GeneralError(
            'Create folder controller failed',
            state.error!,
            state.stackTrace,
          ).logError().message,
        );
      }
    });

    return SimpleDialog(
      title: const Text('Create a new connection'),
      contentPadding: const EdgeInsets.all(24),
      children: [
        TextField(
          controller: _titleController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Title',
          ),
        ),
        const SizedBox(height: 16),
        DropdownButton<DriveProviderModel?>(
          items: authInfo.requireValue
              .filter(
                (authModel) =>
                    authModel.remoteName !=
                    'secondSelectedProvider.value.toNullable()?.remoteName',
              )
              .map(
                (authModel) => DropdownMenuItem(
                  value: authModel,
                  child: Text(
                    '${authModel.provider.displayName} - ${authModel.remoteName}',
                  ),
                ),
              )
              .toList(),
          value: firstSelectedProvider.value.toNullable(),
          isExpanded: true,
          hint: const Text('Enter first remote'),
          onChanged: (DriveProviderModel? e) {
            firstSelectedProvider.value = Option.fromNullable(e);
          },
        ),
        DropdownButton<DriveProviderModel?>(
          items: authInfo.requireValue
              .filter(
                (authModel) =>
                    authModel.remoteName !=
                    'firstSelectedProvider.value.toNullable()?.remoteName',
              )
              .map(
                (authModel) => DropdownMenuItem(
                  value: authModel,
                  child: Text(
                    '${authModel.provider.displayName} - ${authModel.remoteName}',
                  ),
                ),
              )
              .toList(),
          value: secondSelectedProvider.value.toNullable(),
          isExpanded: true,
          hint: const Text('Enter second remote'),
          onChanged: (DriveProviderModel? e) {
            secondSelectedProvider.value = Option.fromNullable(e);
          },
        ),
        const SizedBox(height: 16),
        SegmentedButton<SyncDirection>(
          showSelectedIcon: false,
          segments: SyncDirection.values
              .map(
                (dir) => ButtonSegment(
                  value: dir,
                  label: Text(dir.name),
                  icon: Icon(switch (dir) {
                    SyncDirection.bidirectional => Icons.sync,
                    SyncDirection.upload => Icons.upload,
                    SyncDirection.download => Icons.download,
                  }),
                ),
              )
              .toList(),
          selected: selectedDirection.value,
          onSelectionChanged: (val) {
            selectedDirection.value = val;
          },
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          child: createFolderController.isLoading
              ? const SizedBox.square(
                  dimension: 20.0,
                  child: CircularProgressWidget(size: 300, isInfinite: true),
                )
              : const Text('Submit'),
          onPressed: () async {
            // TODO: Create folder on remote provider creation in account screen
            if (!createFolderController.isLoading) {
              final content = Option.Do(($) {
                final title = $(
                  Option.fromNullable(
                    _titleController.text.isNotEmpty
                        ? _titleController.text
                        : null,
                  ),
                );
                final firstProvider = $(firstSelectedProvider.value);
                final secondProvider = $(secondSelectedProvider.value);

                return (title, firstProvider, secondProvider);
              });

              content.match(
                () => context.showErrorSnackBar(
                  'One or both of the fields are not filled',
                ),
                (t) async {
                  // TODO: Show this only on no error
                  if (context.mounted) {
                    context.showSuccessSnackBar(
                      content: 'Successfully linked folder',
                    );
                    Navigator.of(context).pop();
                  }
                },
              );
            }
          },
        ),
      ],
    );
  }
}
