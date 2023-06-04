import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/helpers.dart';
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
                      children: [
                        SvgPicture.asset(
                          'assets/logos/onedrive.svg',
                          width: 70,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 32.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.name.capitalize(),
                                style: const TextStyle(fontSize: 25),
                              ),
                              Text(
                                e.email,
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Stack(
                          children: [
                            SizedBox(
                              width: 75,
                              height: 75,
                              child: Center(
                                child: Text(
                                  '${(e.usedStorage / e.remainingStorage * 100).toStringAsFixed(2)} %\nused',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 75,
                              height: 75,
                              child: CircularProgressIndicator(
                                value: e.usedStorage / e.remainingStorage,
                                backgroundColor: Colors.deepPurple,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
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
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            backgroundColor:
                                                Theme.of(context).primaryColor,
                                            foregroundColor:
                                                Theme.of(context).cardColor,
                                          ),
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
                        )
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
