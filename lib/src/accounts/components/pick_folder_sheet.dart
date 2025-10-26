import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart';
import 'package:syncvault/src/accounts/controllers/folder_controller.dart'
    hide ListView;
import 'package:syncvault/src/common/components/circular_progress_widget.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';

class PickFolderSheet extends HookConsumerWidget {
  const PickFolderSheet({
    super.key,
    required this.providerModel,
    required this.folderNameController,
    required this.parentPathController,
  });

  final DriveProviderModel providerModel;
  final TextEditingController folderNameController;
  final TextEditingController parentPathController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocationUri = useState(Uri.file('/'));
    final files = ref.watch(listViewProvider(providerModel, '/'));

    return switch (files) {
      AsyncData(:final value) => ListView(
        padding: EdgeInsets.all(8),
        children: [
          Row(
            children: [
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () async {
                    if (currentLocationUri.value.pathSegments.length <= 1) {
                      return;
                    }

                    final parent = joinAll(
                      currentLocationUri.value.pathSegments.dropRight(2),
                    );
                    await ref
                        .read(listViewProvider(providerModel, '/').notifier)
                        .updateList(providerModel, parent);
                    currentLocationUri.value = Uri.file(parent);
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () async {
                    if (currentLocationUri.value.pathSegments.length <= 1) {
                      return;
                    }

                    await ref
                        .read(listViewProvider(providerModel, '/').notifier)
                        .updateList(providerModel, '/');
                    currentLocationUri.value = Uri.file('/');
                  },
                ),
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.location_on_sharp),
            title: Text(currentLocationUri.value.path),
          ),
          ...value.map(
            (file) => ListTile(
              leading: Icon(
                file.isDirectory ? Icons.folder : Icons.file_copy_rounded,
              ),
              title: Text(file.name),
              trailing: file.isDirectory
                  ? IconButton.outlined(
                      onPressed: () async {
                        folderNameController.text = file.name;
                        parentPathController.text = file.parent.path;

                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.check),
                    )
                  : null,
              onTap: file.isDirectory
                  ? () async {
                      currentLocationUri.value = file.file.uri;
                      await ref
                          .read(listViewProvider(providerModel, '/').notifier)
                          .updateList(providerModel, file.file.path);
                    }
                  : null,
            ),
          ),
        ],
      ),
      AsyncLoading() => CircularProgressWidget(size: 200),
      AsyncError(:final error) => Text(error.toString()),
    };
  }
}
