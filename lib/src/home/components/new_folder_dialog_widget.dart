import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/helpers.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/controllers/folder_controller.dart';
import 'package:syncvault/src/accounts/models/auth_provider_model.dart';

class NewFolderDialogWidget extends StatefulHookConsumerWidget {
  const NewFolderDialogWidget({Key? key}) : super(key: key);

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
    final driveInfo = ref.watch(authProvider);

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
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: DropdownButton<AuthProviderModel?>(
            items: driveInfo
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.email),
                    ))
                .toList(),
            value: selectedProvider.value.toNullable(),
            isExpanded: true,
            hint: const Text('Enter provider account'),
            onChanged: (AuthProviderModel? e) {
              selectedProvider.value = e.toOption();
            },
          ),
        ),
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
                  selectedFolder.value = result.toOption();
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32, left: 32, right: 32),
          child: ElevatedButton(
            child: const Text('Submit'),
            onPressed: () async {
              final Option<(AuthProviderModel, String, String)> content =
                  selectedProvider.value.match(
                () => none(),
                (t) => selectedFolder.value.match(
                  () => none(),
                  (r) => _controller.text != ''
                      ? some((t, r, _controller.text))
                      : none(),
                ),
              );

              content.match(
                () => context.showErrorSnackBar(
                  'One or both of the fields are not filled',
                ),
                (t) {
                  ref.watch(folderProvider.notifier).create(t.$1, t.$2, t.$3);
                  context.showSuccessSnackBar(
                    content: 'Successfully linked folder',
                    action: none(),
                  );
                },
              );

              if (context.mounted) Navigator.of(context).pop();
            },
          ),
        )
      ],
    );
  }
}
