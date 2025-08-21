import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/extensions.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/controllers/folder_controller.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/src/common/utils/associations.dart';
import 'package:syncvault/src/home/controllers/connection_controller.dart';
import 'package:syncvault/src/home/models/connection_model.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';

class NewConnectionDialogWidget extends StatefulHookConsumerWidget {
  const NewConnectionDialogWidget({super.key});

  @override
  ConsumerState<NewConnectionDialogWidget> createState() =>
      _NewConnectionDialogWidgetState();
}

class _NewConnectionDialogWidgetState
    extends ConsumerState<NewConnectionDialogWidget> {
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
    final firstSelectedFolder = useState<Option<FolderModel>>(const None());
    final secondSelectedFolder = useState<Option<FolderModel>>(const None());
    final selectedDirection = useState<Set<SyncDirection>>({
      SyncDirection.upload,
    });

    final allProviders = ref.watch(authProvider).requireValue;
    final folders = ref.watch(folderProvider);

    final providersMap = Map.fromIterables(
      folders.map((folder) => folder.id),
      folders.map((folder) => getProviderFromFolder(allProviders, folder)),
    );

    final connectionNotifier = ref.read(connectionProvider.notifier);

    ref.listen<AsyncValue>(createFolderControllerProvider, (prev, state) {
      if (!state.isLoading && state.hasError) {
        context.showErrorSnackBar(
          GeneralError(
            'Create connection controller failed',
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
        DropdownButton<FolderModel?>(
          items: folders
              .filter((folder) {
                final secondFolder = secondSelectedFolder.value.toNullable();

                final isUnique = folder.id != secondFolder?.id;
                final multipleLocals =
                    secondFolder is LocalFolderModel &&
                    folder is LocalFolderModel;

                return isUnique && !multipleLocals;
              })
              .map(
                (folder) => DropdownMenuItem(
                  value: folder,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      switch (providersMap[folder.id]!.toNullable()!) {
                        LocalProviderModel() => Icon(Icons.folder),
                        RemoteProviderModel(:final provider) =>
                          SvgPicture.asset(provider.providerIcon),
                      },
                      Text(switch (providersMap[folder.id]!.toNullable()!) {
                        LocalProviderModel() => folder.folderName,
                        RemoteProviderModel(:final remoteName) =>
                          '$remoteName | ${folder.folderName}',
                      }),
                    ],
                  ),
                ),
              )
              .toList(),
          value: firstSelectedFolder.value.toNullable(),
          isExpanded: true,
          hint: const Text('Select first folder'),
          onChanged: (FolderModel? model) {
            firstSelectedFolder.value = Option.fromNullable(model);
          },
        ),
        DropdownButton<FolderModel?>(
          items: folders
              .filter((folder) {
                final firstFolder = firstSelectedFolder.value.toNullable();

                final isUnique = folder.id != firstFolder?.id;
                final multipleLocals =
                    firstFolder is LocalFolderModel &&
                    folder is LocalFolderModel;

                return isUnique && !multipleLocals;
              })
              .map(
                (folder) => DropdownMenuItem(
                  value: folder,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      switch (providersMap[folder.id]!.toNullable()!) {
                        LocalProviderModel() => Icon(Icons.folder),
                        RemoteProviderModel(:final provider) =>
                          SvgPicture.asset(provider.providerIcon),
                      },
                      Text(switch (providersMap[folder.id]!.toNullable()!) {
                        LocalProviderModel() => folder.folderName,
                        RemoteProviderModel(:final remoteName) =>
                          '$remoteName | ${folder.folderName}',
                      }),
                    ],
                  ),
                ),
              )
              .toList(),
          value: secondSelectedFolder.value.toNullable(),
          isExpanded: true,
          hint: const Text('Select second folder'),
          onChanged: (FolderModel? e) {
            secondSelectedFolder.value = Option.fromNullable(e);
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
          child: const Text('Submit'),
          onPressed: () async {
            final content = Option.Do(($) {
              final title = $(
                Option.fromNullable(
                  _titleController.text.isNotEmpty
                      ? _titleController.text
                      : null,
                ),
              );
              final firstFolder = $(firstSelectedFolder.value);
              final secondFolder = $(secondSelectedFolder.value);

              return (title, firstFolder, secondFolder);
            });

            content.match(
              () => context.showErrorSnackBar(
                'One or both of the fields are not filled',
              ),
              (t) async {
                connectionNotifier.create(
                  title: t.$1,
                  firstFolder: t.$2,
                  secondFolder: t.$3,
                  direction: selectedDirection.value.first,
                );

                // TODO: Show this only on no error
                if (context.mounted) {
                  context.showSuccessSnackBar(
                    content: 'Successfully created connection',
                  );
                  Navigator.of(context).pop();
                }
              },
            );
          },
        ),
      ],
    );
  }
}
