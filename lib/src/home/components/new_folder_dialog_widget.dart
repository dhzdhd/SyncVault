import 'package:file_picker/file_picker.dart';
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

class NewFolderDialogWidget extends StatefulHookConsumerWidget {
  const NewFolderDialogWidget({super.key});

  @override
  ConsumerState<NewFolderDialogWidget> createState() =>
      _NewFolderDialogWidgetState();
}

class _NewFolderDialogWidgetState extends ConsumerState<NewFolderDialogWidget> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedProvider = useState<Option<DriveProviderModel>>(const None());
    final selectedFolder = useState<Option<String>>(const None());
    final authInfo = ref.watch(authProvider);
    final createFolderController = ref.watch(createFolderControllerProvider);

    ref.listen<AsyncValue>(
      createFolderControllerProvider,
      (prev, state) {
        if (!state.isLoading && state.hasError) {
          context.showErrorSnackBar(state.error!
              .handleError('Create folder controller failed',
                  state.stackTrace ?? StackTrace.empty)
              .message);
        }
      },
    );

    return SimpleDialog(
      title: const Text('Sync a new folder'),
      contentPadding: const EdgeInsets.all(24),
      children: [
        TextField(
          controller: _controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Name of folder',
          ),
        ),
        const SizedBox(height: 16),
        DropdownButton<DriveProviderModel?>(
          items: authInfo
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child:
                      Text('${e.provider.name.capitalize()} - ${e.remoteName}'),
                ),
              )
              .toList(),
          value: selectedProvider.value.toNullable(),
          isExpanded: true,
          hint: const Text('Enter provider account'),
          onChanged: (DriveProviderModel? e) {
            selectedProvider.value = Option.fromNullable(e);
          },
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Tooltip(
                message:
                    selectedFolder.value.toNullable() ?? 'Not selected yet',
                child: Text(
                  selectedFolder.value.toNullable() ?? 'Not selected yet',
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
        const SizedBox(height: 32),
        ElevatedButton(
          child: createFolderController.isLoading
              ? const SizedBox.square(
                  dimension: 20.0,
                  child: CircularProgressWidget(size: 300, isInfinite: true),
                )
              : const Text('Submit'),
          onPressed: () async {
            if (!createFolderController.isLoading) {
              final Option<(DriveProviderModel, String, String)> content =
                  selectedProvider.value.match(
                () => none(),
                (t) => selectedFolder.value.match(() => none(), (r) {
                  final folderName = _controller.text;
                  if (_controller.text.trim().isNotEmpty &&
                      !ref
                          .read(folderProvider)
                          .any((element) => element.folderName == folderName)) {
                    return some((t, r, folderName));
                  } else {
                    return none();
                  }
                }),
              );

              content.match(
                () => context.showErrorSnackBar(
                  'One or both of the fields are not filled',
                ),
                (t) async {
                  await ref
                      .read(createFolderControllerProvider.notifier)
                      .createFolder(
                        authModel: t.$1,
                        folderPath: t.$2,
                        folderName: t.$3,
                      );

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
        )
      ],
    );
  }
}
