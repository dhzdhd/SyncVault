import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/controllers/folder_controller.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';

class FolderCard extends ConsumerWidget {
  const FolderCard({
    super.key,
    required this.providerModel,
    required this.folderModel,
    required this.isLast,
  });

  final DriveProviderModel providerModel;
  final FolderModel folderModel;
  final bool isLast;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final folderNotifier = ref.read(folderProvider.notifier);

    final textTheme = Theme.of(context).textTheme;
    final radius = isLast ? 16.0 : 0.0;

    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(radius),
            bottomRight: Radius.circular(radius),
          ),
        ),
        margin: EdgeInsets.only(left: 4.0, right: 4.0, top: 2.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  spacing: 20,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width < 500
                              ? 2.0
                              : 5.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 3,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  folderModel.folderName,
                                  style: MediaQuery.of(context).size.width < 500
                                      ? textTheme.titleLarge
                                      : textTheme.headlineSmall,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                            Text(switch (folderModel) {
                              LocalFolderModel(:final folderPath) => folderPath,
                              RemoteFolderModel(
                                :final folderName,
                                :final parentPath,
                              ) =>
                                '$parentPath$folderName',
                            }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton.filledTonal(
                onPressed: () {
                  if (context.mounted) {
                    // showModalBottomSheet(
                    //   context: context,
                    //   builder: (ctx) =>
                    //       TreeViewSheetWidget(providerModel: providerModel),
                    // );
                  }
                },
                icon: Icon(Icons.device_hub_rounded),
              ),
              IconButton.filledTonal(
                onPressed: () async {
                  // TODO: Add dialog to ask for delete, implement folder deletion
                  await folderNotifier.delete(folderModel, false);
                },
                icon: Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
