import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/helpers.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/controllers/folder_controller.dart';
import 'package:syncvault/src/accounts/models/auth_provider_model.dart';

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
    final selectedProvider = useState<Option<AuthProviderModel>>(const None());
    final selectedFolder = useState<Option<String>>(const None());
    final authInfo = ref.watch(authProvider);
    // final authInfoCopy = useState<List<AuthProviderModel>>(authInfo);
    final createFolderController = ref.watch(createFolderControllerProvider);

    ref.listen<AsyncValue>(
      createFolderControllerProvider,
      (prev, state) {
        if (!state.isLoading && state.hasError) {
          context.showErrorSnackBar(state.error!.segregateError().message);
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
        // Padding(
        //   padding: const EdgeInsets.only(top: 16.0),
        //   child: DropdownButton<AuthProviderModel?>(
        //     items: authInfoCopy.value
        //         .map(
        //           (e) => DropdownMenuItem(
        //             value: e,
        //             child: Text('${e.provider.name.capitalize()} - ${e.email}'),
        //           ),
        //         )
        //         .toList(),
        //     value: selectedProvider.value.toNullable(),
        //     isExpanded: true,
        //     hint: const Text('Enter provider account'),
        //     onChanged: (AuthProviderModel? e) {
        //       selectedProvider.value = Option.fromNullable(e);
        //     },
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(
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
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32, left: 32, right: 32),
          child: ElevatedButton(
            child: createFolderController.isLoading
                ? const SizedBox.square(
                    dimension: 20.0,
                    child: CircularProgressIndicator(),
                  )
                : const Text('Submit'),
            onPressed: () async {
              if (!createFolderController.isLoading) {
                final Option<(AuthProviderModel, String, String)> content =
                    selectedProvider.value.match(
                  () => none(),
                  (t) => selectedFolder.value.match(() => none(), (r) {
                    final folderName = _controller.text;
                    if (_controller.text.trim().isNotEmpty &&
                        !ref.read(folderProvider).any(
                            (element) => element.folderName == folderName)) {
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
                        .createFolder(t.$1, t.$2, t.$3);

                    if (context.mounted) {
                      context.showSuccessSnackBar(
                        content: 'Successfully linked folder',
                        action: none(),
                      );
                      Navigator.of(context).pop();
                    }
                  },
                );
              }
            },
          ),
        )
      ],
    );
  }
}
