import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/extensions.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/src/common/components/circular_progress_widget.dart';
import 'package:syncvault/src/accounts/controllers/folder_controller.dart';
import 'package:syncvault/src/home/models/drive_provider.dart';
import 'package:syncvault/src/home/models/drive_provider_backend.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';

class NewFolderDialogWidget extends StatefulHookConsumerWidget {
  const NewFolderDialogWidget({super.key, required this.providerModel});

  final DriveProviderModel providerModel;

  @override
  ConsumerState<NewFolderDialogWidget> createState() =>
      _NewFolderDialogWidgetState();
}

class _NewFolderDialogWidgetState extends ConsumerState<NewFolderDialogWidget> {
  late final TextEditingController _folderNameController;
  late final TextEditingController _parentPathController;

  @override
  void initState() {
    super.initState();
    _folderNameController = TextEditingController();
    _parentPathController = TextEditingController();
  }

  @override
  void dispose() {
    _folderNameController.dispose();
    _parentPathController.dispose();
    super.dispose();
  }

  bool validateControllers(List<TextEditingController> controllers) {
    return controllers.all((val) => val.text.isNotEmpty);
  }

  bool validateSelectedFolder(Option<String> path) {
    return path.isSome();
  }

  @override
  Widget build(BuildContext context) {
    final selected = useState<DriveProvider>(OneDriveProvider());
    final selectedFolder = useState<Option<String>>(const None());
    final authController = ref.watch(authControllerProvider);

    ref.listen<AsyncValue>(authControllerProvider, (prev, state) {
      if (!state.isLoading && state.hasError) {
        context.showErrorSnackBar(
          GeneralError(
            'Auth controller failed',
            state.error!,
            state.stackTrace,
          ).logError().message,
        );
      }
    });

    return SimpleDialog(
      title: const Text('Register a new folder'),
      contentPadding: const EdgeInsets.all(24),
      children: [
        TextField(
          controller: _folderNameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Title',
          ),
        ),
        const SizedBox(height: 16),
        switch (widget.providerModel) {
          LocalProviderModel() => Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Tooltip(
                  message:
                      selectedFolder.value.toNullable() ??
                      'Select local folder',
                  child: Text(
                    selectedFolder.value.toNullable() ?? 'Select local folder',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.folder),
                tooltip: 'Get directory',
                onPressed: () async {
                  final result = await FilePicker.platform.getDirectoryPath();
                  selectedFolder.value = Option.fromNullable(result);
                },
              ),
            ],
          ),
          RemoteProviderModel(:final backend) => (switch (backend) {
            OAuth2() => TextField(
              controller: _parentPathController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Parent path',
              ),
            ),
            _ => SizedBox(),
          }),
        },
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: () async {
            if (!authController.isLoading) {
              final valid = switch (widget.providerModel) {
                RemoteProviderModel(:final backend) => switch (backend) {
                  OAuth2() => validateControllers([
                    _folderNameController,
                    _parentPathController,
                  ]),
                  _ => validateControllers([_folderNameController]),
                },
                LocalProviderModel() =>
                  validateControllers([_folderNameController]) &&
                      validateSelectedFolder(selectedFolder.value),
              };

              if (valid) {
                await ref
                    .read(createFolderControllerProvider.notifier)
                    .createFolder(
                      folderName: _folderNameController.text,
                      parentPath: switch (widget.providerModel) {
                        RemoteProviderModel(:final backend) =>
                          switch (backend) {
                            OAuth2() => some(_parentPathController.text),
                            _ => none(),
                          },
                        LocalProviderModel() => selectedFolder.value,
                      },
                      model: widget.providerModel,
                    );

                if (context.mounted && !authController.isLoading) {
                  Navigator.of(context).pop();
                }
              }
            } else {
              context.showErrorSnackBar('Fields are empty');
            }
          },
          child: authController.isLoading
              ? const SizedBox.square(
                  dimension: 20.0,
                  child: CircularProgressWidget(size: 300, isInfinite: true),
                )
              : const Text('Submit'),
        ),
      ],
    );
  }
}
