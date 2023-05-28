import 'package:flutter/material.dart';
import 'package:syncvault/src/accounts/views/account_view.dart';
import 'package:syncvault/src/accounts/services/auth_service.dart';

import '../../settings/views/settings_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sync Vault'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.restorablePushNamed(context, AccountView.routeName);
            },
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Click'),
          onPressed: () async {
            await OneDriveAuth().signIn();
          },
        ),
      ),
    );
  }
}
