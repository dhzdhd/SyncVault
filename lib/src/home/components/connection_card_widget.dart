import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/extensions.dart';
import 'package:syncvault/src/common/components/circular_progress_widget.dart';
import 'package:syncvault/src/home/components/expandable_card_widget.dart';
import 'package:syncvault/src/home/models/connection_model.dart';
import 'package:url_launcher/url_launcher.dart';

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
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      connectionModel.title,
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (PlatformExtension.isDesktop)
                          Flexible(
                            child: SizedBox(
                              width: 50,
                              child: Tooltip(
                                message: 'Open in file manager',
                                child: TextButton(
                                  child: const Icon(Icons.open_in_new),
                                  onPressed: () async {
                                    await launchUrl(
                                      Uri.file(connectionModel.title),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        Flexible(
                          child: SizedBox(
                            width: 50,
                            child: Tooltip(
                              message: 'Sync',
                              child: TextButton(
                                child: const Icon(Icons.sync),
                                onPressed: () async {
                                  if (uploadDeleteController.isLoading) {
                                    return;
                                  }
                                  isLoading.value = true;

                                  if (!uploadDeleteController.isLoading) {
                                    // await ref
                                    //     .read(
                                    //       uploadDeleteControllerProvider
                                    //           .notifier,
                                    //     )
                                    //     .upload(
                                    //       connectionModel,
                                    //       none(),
                                    //     );

                                    if (context.mounted) {
                                      context.showSuccessSnackBar(
                                        content: 'Success',
                                      );
                                    }
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
                                  if (uploadDeleteController.isLoading) {
                                    return;
                                  }

                                  if (context.mounted) {
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
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Account', style: Theme.of(context).textTheme.bodyLarge),
              Text(
                connectionModel.firstFolderId,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
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
                    onChanged: (val) => null,
                    // folderNotifier
                    //     .toggleAutoSync(connectionModel),
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
                    onChanged: (val) => null,
                    // folderNotifier.toggleDeletionOnSync(
                    //   connectionModel,
                    // ),
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
