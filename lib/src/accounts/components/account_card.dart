import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/components/delete_account_dialog.dart';
import 'package:syncvault/src/accounts/components/drive_info_dialog.dart';
import 'package:syncvault/src/accounts/components/folder_card.dart';
import 'package:syncvault/src/accounts/components/new_folder_dialog.dart';
import 'package:syncvault/src/accounts/controllers/folder_controller.dart';
import 'package:syncvault/src/accounts/controllers/status_controller.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/src/home/models/drive_provider_backend.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';

class AccountCard extends ConsumerWidget {
  const AccountCard({super.key, required this.providerModel});

  final RemoteProviderModel providerModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final connectionStatus = ref.watch(connectionStatusProvider(providerModel));
    final folders = ref
        .watch(folderProvider)
        .filter(
          (folderModel) =>
              folderModel is RemoteFolderModel &&
              folderModel.remoteName == providerModel.remoteName,
        );

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
                      Badge(
                        backgroundColor: switch (connectionStatus) {
                          AsyncData(:final value) =>
                            value ? Colors.green : Colors.red,
                          AsyncLoading() => Colors.orange,
                          AsyncError() => Colors.red,
                          AsyncValue<bool>() => Colors.red,
                        },
                      ),
                      Tooltip(
                        message:
                            providerModel.provider.displayName +
                            switch (connectionStatus) {
                              AsyncData(:final value) =>
                                value ? ' | Available' : ' | Unavailable',
                              AsyncLoading() => ' | Checking',
                              AsyncError() => ' | Unavailable',
                              AsyncValue<bool>() => ' | Unavailable',
                            },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width < 500
                              ? 50
                              : 70,
                          height: MediaQuery.of(context).size.width < 500
                              ? 50
                              : 70,
                          child: SvgPicture.asset(
                            providerModel.provider.providerIcon,
                          ),
                        ),
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
                                    providerModel.remoteName,
                                    style:
                                        MediaQuery.of(context).size.width < 500
                                        ? textTheme.titleLarge
                                        : textTheme.headlineSmall,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.secondaryContainer,
                                    ),
                                    padding: const EdgeInsets.only(
                                      left: 6,
                                      right: 6,
                                    ),
                                    child: Text(
                                      providerModel.isRCloneBackend
                                          ? 'RClone'
                                          : 'Manual',
                                    ),
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
                      enabled:
                          connectionStatus.valueOrNull == true &&
                          !connectionStatus.hasError,
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
                                    providerModel: providerModel,
                                    isLocal: false,
                                  ),
                                ),
                              },
                          },
                        );
                      },
                    ),
                    // TODO: Perhaps show drive info for local too??
                    if (providerModel.backend is! Local)
                      PopupMenuItem(
                        enabled:
                            connectionStatus.valueOrNull == true &&
                            !connectionStatus.hasError,
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
                              if (context.mounted)
                                {
                                  showDialog(
                                    context: context,
                                    builder: (ctx) => DriveInfoDialogWidget(
                                      model: providerModel,
                                    ),
                                  ),
                                },
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
                        if (context.mounted) {
                          await showDialog(
                            context: context,
                            builder: (ctx) =>
                                DeleteAccountDialogWidget(model: providerModel),
                          );
                        }
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
            providerModel: providerModel,
            folderModel: folderModel,
          ),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}
