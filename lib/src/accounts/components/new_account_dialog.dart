import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/helpers.dart';
import 'package:syncvault/errors.dart';

class NewAccountDialogWidget extends HookConsumerWidget {
  const NewAccountDialogWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = useState(AuthProviderType.oneDrive);
    final authController = ref.watch(authControllerProvider);

    ref.listen<AsyncValue>(
      authControllerProvider,
      (prev, state) => {
        if (!state.isLoading && state.hasError)
          {
            context.showErrorSnackBar(
                state.error!.segregateError().toErrorString())
          }
      },
    );

    return SimpleDialog(
      title: const Text('Register a new drive account'),
      contentPadding: const EdgeInsets.all(24),
      children: [
        DropdownButton<AuthProviderType>(
          items: AuthProviderType.values
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.name.capitalize()),
                  ))
              .toList(),
          value: selected.value,
          isExpanded: true,
          onChanged: (AuthProviderType? e) {
            selected.value = e!;
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32, left: 32, right: 32),
          child: ElevatedButton(
            onPressed: () async {
              if (!authController.isLoading) {
                await ref
                    .read(authControllerProvider.notifier)
                    .signIn(selected.value);

                if (context.mounted && !authController.isLoading) {
                  Navigator.of(context).pop();
                }
              }
            },
            child: authController.isLoading
                ? const SizedBox.square(
                    dimension: 20.0,
                    child: CircularProgressIndicator(),
                  )
                : const Text('Submit'),
          ),
        )
      ],
    );
  }
}
