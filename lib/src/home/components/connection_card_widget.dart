import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fpdart/src/option.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/extensions.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/controllers/folder_controller.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/src/common/components/circular_progress_widget.dart';
import 'package:syncvault/src/common/utils/associations.dart';
import 'package:syncvault/src/home/components/expandable_card_widget.dart';
import 'package:syncvault/src/home/controllers/connection_controller.dart';
import 'package:syncvault/src/home/models/connection_model.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';

class ConnectionCardWidget extends HookConsumerWidget {
  const ConnectionCardWidget({
    super.key,
    required this.uploadDeleteController,
    required this.connectionModel,
  });

  final AsyncValue<void> uploadDeleteController;
  final ConnectionModel connectionModel;

  final index = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    final connectionNotifier = ref.read(connectionProvider.notifier);
    final folders = ref.watch(folderProvider);
    final providers = ref.watch(authProvider).value!;

    final (firstFolder, secondFolder) = getFoldersFromConnection(
      connectionModel,
      folders,
    );
    final firstProvider = getProviderFromFolder(
      providers,
      firstFolder.toNullable()!,
    ).toNullable()!;
    final secondProvider = getProviderFromFolder(
      providers,
      secondFolder.toNullable()!,
    ).toNullable()!;

    return ExpandableCardWidget(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            connectionModel.title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Visibility(
          visible: uploadDeleteController.isLoading && isLoading.value,
          child: const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressWidget(size: 300, isInfinite: true),
          ),
        ),
      ),
      child: Column(
        spacing: 8.0,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (MediaQuery.of(context).size.width > 800) {
                  return Row(
                    children: [
                      Expanded(
                        child: FolderBar(
                          firstProvider: firstProvider,
                          firstFolder: firstFolder,
                          connectionModel: connectionModel,
                          secondProvider: secondProvider,
                          secondFolder: secondFolder,
                        ),
                      ),
                      Flexible(
                        child: ToolBar(
                          connectionModel: connectionModel,
                          isLoading: isLoading,
                          isCentered: false,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    spacing: 10,
                    children: [
                      FolderBar(
                        firstProvider: firstProvider,
                        firstFolder: firstFolder,
                        connectionModel: connectionModel,
                        secondProvider: secondProvider,
                        secondFolder: secondFolder,
                      ),
                      ToolBar(
                        connectionModel: connectionModel,
                        isLoading: isLoading,
                        isCentered: true,
                      ),
                    ],
                  );
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Auto sync', style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(
                height: 30,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Switch(
                    value: connectionModel.isAutoSync,
                    onChanged: (val) =>
                        connectionNotifier.toggleAutoSync(connectionModel),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delete on sync',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: 30,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Switch(
                    value: connectionModel.isDeletionEnabled,
                    onChanged: (val) => connectionNotifier.toggleDeletionOnSync(
                      connectionModel,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FolderBar extends StatelessWidget {
  const FolderBar({
    super.key,
    required this.firstProvider,
    required this.firstFolder,
    required this.connectionModel,
    required this.secondProvider,
    required this.secondFolder,
  });

  final DriveProviderModel firstProvider;
  final Option<FolderModel> firstFolder;
  final ConnectionModel connectionModel;
  final DriveProviderModel secondProvider;
  final Option<FolderModel> secondFolder;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 16.0,
            ),
            child: Row(
              spacing: 10,
              children: [
                switch (firstProvider) {
                  LocalProviderModel() => Icon(Icons.folder, size: 42),
                  RemoteProviderModel(:final provider) => SvgPicture.asset(
                    provider.providerIcon,
                    width: 42,
                    height: 42,
                  ),
                },
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(firstFolder.toNullable()!.folderName),
                      Text(switch (firstFolder.toNullable()!) {
                        RemoteFolderModel(:final parentPath) =>
                          parentPath ?? '',
                        LocalFolderModel(:final folderPath) => folderPath,
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          child: Icon(switch (connectionModel.direction) {
            SyncDirection.bidirectional => Icons.sync,
            SyncDirection.upload => Icons.arrow_forward_rounded,
            SyncDirection.download => Icons.arrow_back_rounded,
          }),
        ),
        Flexible(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 16.0,
            ),
            child: Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                switch (secondProvider) {
                  LocalProviderModel() => Icon(Icons.folder, size: 42),
                  RemoteProviderModel(:final provider) => SvgPicture.asset(
                    provider.providerIcon,
                    width: 42,
                    height: 42,
                  ),
                },
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(secondFolder.toNullable()!.folderName),
                      Text(switch (secondFolder.toNullable()!) {
                        RemoteFolderModel(:final parentPath) =>
                          parentPath ?? '',
                        LocalFolderModel(:final folderPath) => folderPath,
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ToolBar extends ConsumerWidget {
  const ToolBar({
    super.key,
    required this.connectionModel,
    required this.isLoading,
    required this.isCentered,
  });

  final ConnectionModel connectionModel;
  final ValueNotifier<bool> isLoading;
  final bool isCentered;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: isCentered
          ? MainAxisAlignment.center
          : MainAxisAlignment.end,
      children: [
        Flexible(
          child: SizedBox(
            width: 50,
            child: Tooltip(
              message: 'Sync',
              child: TextButton(
                child: const Icon(Icons.sync),
                onPressed: () async {
                  await ref
                      .read(syncControllerProvider.notifier)
                      .sync_(connectionModel);

                  if (context.mounted) {
                    context.showSuccessSnackBar(content: 'Success');
                  }
                },
              ),
            ),
          ),
        ),
        Flexible(
          child: SizedBox(
            width: 50,
            child: Tooltip(
              message: 'Delete',
              child: TextButton(
                child: const Icon(Icons.delete),
                onPressed: () async {
                  if (context.mounted) {
                    // await showDialog(
                    //   context: context,
                    //   builder: (ctx) =>
                    //       DeleteFolderDialogWidget(
                    //         model:
                    //             connectionModel,
                    //       ),
                    // );
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
