import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/models/auth_provider_model.dart';
import 'package:syncvault/helpers.dart';

class NewFolderDialogWidget extends HookConsumerWidget {
  const NewFolderDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedProvider = useState<AuthProviderModel?>(null);
    final selectedFolder = useState<String?>(null);
    final driveInfo = ref.watch(authProvider);

    return SimpleDialog(
      title: const Text('Sync a new folder'),
      contentPadding: const EdgeInsets.all(24),
      children: [
        DropdownButton<AuthProviderModel>(
          items: driveInfo
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.email),
                  ))
              .toList(),
          value: selectedProvider.value,
          isExpanded: true,
          onChanged: (AuthProviderModel? e) {
            selectedProvider.value = e;
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Folder',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32, left: 32, right: 32),
          child: ElevatedButton(
            onPressed: () async {
              if (context.mounted) Navigator.of(context).pop();
            },
            child: const Text('Submit'),
          ),
        )
      ],
    );
  }
}
