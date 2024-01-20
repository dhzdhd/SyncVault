import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/helpers.dart';
import 'package:syncvault/src/accounts/components/delete_account_dialog.dart';
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
                                switch (e.provider) {
                                  AuthProviderType.oneDrive =>
                                    'assets/logos/onedrive.svg',
                                  AuthProviderType.dropBox =>
                                    'assets/logos/dropbox.svg',
                                  AuthProviderType.googleDrive =>
                                    'assets/logos/gdrive.svg'
                                },
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
                                await Future.delayed(
                                  Duration.zero,
                                  () => showDialog(
                                    context: context,
                                    builder: (ctx) => DriveInfoDialogWidget(
                                      model: e,
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
                              onTap: () async {
                                if (context.mounted) {
                                  await showDialog(
                                    context: context,
                                    builder: (ctx) =>
                                        DeleteAccountDialogWidget(model: e),
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
              )
              .toList(),
        ),
      ),
    );
  }
}
