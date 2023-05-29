import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    final authInfo = ref.watch(authProvider);

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
                                  '${(e.usedStorage / e.remainingStorage).toStringAsFixed(2)} %\nused',
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
