import 'package:flutter/material.dart';
import 'package:syncvault/src/cloud/services/cloud_base.dart';

import '../settings/views/settings_view.dart';

class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    super.key,
  });

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Items'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Click'),
          onPressed: () async {
            await OneDrive().signIn("", "");
          },
        ),
      ),
    );
  }
}
