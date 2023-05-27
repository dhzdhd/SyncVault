import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/helpers.dart';
import 'package:syncvault/src/accounts/components/new_account_dialog.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';

class AccountView extends ConsumerWidget {
  const AccountView({
    super.key,
  });

  static const routeName = '/accounts';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accounts'),
      ),
      floatingActionButton: FloatingActionButton(
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
          children: ref
              .watch(authProvider)
              .map(
                (e) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.provider.name.capitalize(),
                          style: const TextStyle(fontSize: 25),
                        ),
                        Text(
                          '...',
                          style: const TextStyle(fontSize: 20),
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
