import 'package:flutter/material.dart';

class AccountView extends StatelessWidget {
  const AccountView({
    super.key,
  });

  static const routeName = '/accounts';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accounts'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'OneDrive',
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      '...',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
