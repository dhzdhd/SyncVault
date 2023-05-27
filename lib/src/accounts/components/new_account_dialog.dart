import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/helpers.dart';

class NewAccountDialogWidget extends HookConsumerWidget {
  const NewAccountDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedProvider = useState(AuthProvider.oneDrive);

    return SimpleDialog(
      title: const Text('Create a new account'),
      children: [
        DropdownButton<AuthProvider>(
          padding: const EdgeInsets.only(left: 32, right: 32),
          items: AuthProvider.values
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.name.capitalize()),
                  ))
              .toList(),
          value: selectedProvider.value,
          isExpanded: true,
          onChanged: (AuthProvider? e) {
            selectedProvider.value = e!;
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32, left: 32, right: 32),
          child: ElevatedButton(
            onPressed: () async {
              await ref
                  .watch(authProvider.notifier)
                  .signIn(selectedProvider.value);
            },
            child: const Text('Submit'),
          ),
        )
      ],
    );
  }
}
