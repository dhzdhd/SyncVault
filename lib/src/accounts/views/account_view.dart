import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/components/account_card.dart';
import 'package:syncvault/src/accounts/components/local_account_card.dart';
import 'package:syncvault/src/accounts/components/new_account_dialog.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/common/components/sliver_animated_app_bar.dart';

class AccountView extends ConsumerWidget {
  const AccountView({super.key});

  static const routeName = '/accounts';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authInfo = ref.watch(authProvider).requireValue;

    return Scaffold(
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
      body: CustomScrollView(
        slivers: [
          SliverAnimatedAppBar(
            title: 'Accounts',
            canExpand: authInfo.isNotEmpty,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed([
                LocalAccountCard(),
                ...authInfo.map(
                  (providerModel) => AccountCard(providerModel: providerModel),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
