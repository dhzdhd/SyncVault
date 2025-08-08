import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/components/drive_info_dialog.dart';
import 'package:syncvault/src/accounts/components/folder_card.dart';
import 'package:syncvault/src/accounts/components/new_folder_dialog.dart';
import 'package:syncvault/src/accounts/controllers/folder_controller.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';

class AccountCard extends ConsumerWidget {
  const AccountCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final folders = ref
        .watch(folderProvider)
        .filter((folderModel) => folderModel is LocalFolderModel);

    return Column(
      children: [
        Card(
          margin: EdgeInsets.only(left: 4.0, right: 4.0),
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width < 500
                            ? 50
                            : 70,
                        height: MediaQuery.of(context).size.width < 500
                            ? 50
                            : 70,
                        child: Icon(Icons.folder),
                      ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Local',
                                    style:
                                        MediaQuery.of(context).size.width < 500
                                        ? textTheme.titleLarge
                                        : textTheme.headlineSmall,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuButton(
                  itemBuilder: (ctx) => [
                    PopupMenuItem(
                      child: const Row(
                        children: [
                          Text('Add folder'),
                          Spacer(),
                          Icon(Icons.create_new_folder_rounded),
                        ],
                      ),
                      onTap: () async {
                        await Future.delayed(
                          Duration.zero,
                          () => {
                            if (context.mounted)
                              {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => NewFolderDialogWidget(
                                    providerModel: LocalProviderModel(),
                                    isLocal: false,
                                  ),
                                ),
                              },
                          },
                        );
                      },
                    ),
                    // TODO: Perhaps show drive info for local too??
                    PopupMenuItem(
                      child: const Row(
                        children: [
                          Text('Info'),
                          Spacer(),
                          Icon(Icons.info_outline),
                        ],
                      ),
                      onTap: () async {
                        await Future.delayed(
                          Duration.zero,
                          () => {
                            // if (context.mounted)
                            //   {
                            //     showDialog(
                            //       context: context,
                            //       builder: (ctx) => DriveInfoDialogWidget(
                            //         model: LocalProviderModel(),
                            //       ),
                            //     ),
                            //   },
                          },
                        );
                      },
                    ),
                    PopupMenuItem(
                      child: const Row(
                        children: [
                          Text('Delete'),
                          Spacer(),
                          Icon(Icons.delete),
                        ],
                      ),
                      onTap: () async {
                        if (context.mounted) {}
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        ...folders.map(
          (folderModel) => FolderCard(
            providerModel: LocalProviderModel(),
            folderModel: folderModel,
          ),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}
