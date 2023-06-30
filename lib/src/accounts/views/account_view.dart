import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/helpers.dart';
import 'package:syncvault/src/accounts/components/drive_info_dialog.dart';
import 'package:syncvault/src/accounts/components/new_account_dialog.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/controllers/folder_controller.dart';

class AccountView extends ConsumerWidget {
  const AccountView({
    super.key,
  });

  static const routeName = '/accounts';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authInfo = ref.watch(authProvider);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Accounts'),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Register new provider',
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) => const NewAccountDialogWidget(),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: authInfo
              .map(
                (e) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Tooltip(
                              message: e.provider.name.capitalize(),
                              child: SvgPicture.asset(
                                e.provider == AuthProviderType.oneDrive
                                    ? 'assets/logos/onedrive.svg'
                                    : 'assets/logos/dropbox.svg',
                                width: MediaQuery.of(context).size.width < 500
                                    ? 50
                                    : 70,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width < 500
                                      ? 10.0
                                      : 32.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.name.capitalize(),
                                    style:
                                        MediaQuery.of(context).size.width < 500
                                            ? textTheme.titleLarge
                                            : textTheme.headlineSmall,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  Text(
                                    e.email,
                                    style:
                                        MediaQuery.of(context).size.width < 500
                                            ? textTheme.bodyMedium
                                            : textTheme.bodyLarge,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        PopupMenuButton(
                          itemBuilder: (ctx) => [
                            PopupMenuItem(
                              child: const Row(
                                children: [
                                  Text('Info'),
                                  Spacer(),
                                  Icon(Icons.info_outline),
                                ],
                              ),
                              onTap: () async {
                                final info = await ref
                                    .watch(authProvider.notifier)
                                    .getDriveInfo(e);
                                info.match(
                                  (l) => ctx.showErrorSnackBar(
                                    l.message,
                                  ),
                                  (r) async => await Future.delayed(
                                    Duration.zero,
                                    () => showDialog(
                                      context: context,
                                      builder: (ctx) => DriveInfoDialogWidget(
                                        model: r,
                                      ),
                                    ),
                                  ),
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
                              onTap: () {
                                if (ref.read(folderProvider).any(
                                      (element) => element.email == e.email,
                                    )) {
                                  showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      return AlertDialog(
                                        title: const Text('Confirm deletion'),
                                        content: const Text(
                                          'The account contains dependent folders. Are you sure you want to sign out?\n This will delete all dependent folders from the app but not from the drive.',
                                        ),
                                        actions: [
                                          TextButton(
                                            child: const Text('Cancel'),
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                          ),
                                          ElevatedButton(
                                            child: const Text('Confirm'),
                                            onPressed: () => ref
                                                .watch(authProvider.notifier)
                                                .signOut(e),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  ref.watch(authProvider.notifier).signOut(e);
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
