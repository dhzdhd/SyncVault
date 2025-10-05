import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/extensions.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/src/common/components/circular_progress_widget.dart';
import 'package:syncvault/src/home/models/drive_provider.dart';
import 'package:syncvault/src/home/models/drive_provider_backend.dart';

class NewAccountDialogWidget extends StatefulHookConsumerWidget {
  const NewAccountDialogWidget({super.key});

  @override
  ConsumerState<NewAccountDialogWidget> createState() =>
      _NewAccountDialogWidgetState();
}

class _NewAccountDialogWidgetState
    extends ConsumerState<NewAccountDialogWidget> {
  late final TextEditingController _remoteNameController;
  late final TextEditingController _userController;
  late final TextEditingController _passwordController;
  late final TextEditingController _urlController;

  @override
  void initState() {
    super.initState();
    // TODO: Add folderName which is not unique but can be same as remoteName (add switch too)
    _remoteNameController = TextEditingController();
    _urlController = TextEditingController();
    _userController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _remoteNameController.dispose();
    _urlController.dispose();
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool validateControllers(List<TextEditingController> controllers) {
    return controllers.all((val) => val.text.trim().isNotEmpty);
  }

  bool validateSelectedFolder(Option<String> path) {
    return path.isSome();
  }

  @override
  Widget build(BuildContext context) {
    final selected = useState<DriveProvider>(OneDriveProvider());
    final selectedFolder = useState<Option<String>>(const None());
    final isRCloneBackend = useState(!Platform.isIOS);
    final authController = ref.watch(authControllerProvider);

    ref.listen<AsyncValue>(authControllerProvider, (prev, state) {
      if (!state.isLoading && state.hasError) {
        context.showErrorSnackBar(
          GeneralError(
            'Auth controller failed',
            state.error!,
            state.stackTrace,
          ).logError().message,
        );
      }
    });

    return SimpleDialog(
      title: const Text('Register a new remote'),
      contentPadding: const EdgeInsets.all(24),
      children: [
        TextField(
          controller: _remoteNameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Unique remote name',
          ),
        ),
        const SizedBox(height: 16),

        // IOS only supports manual
        if (!Platform.isIOS)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Use RClone', style: TextStyle(fontSize: 16)),
              Switch(
                value: isRCloneBackend.value,
                onChanged: (val) {
                  isRCloneBackend.value = val;
                  selected.value = OneDriveProvider();
                },
              ),
            ],
          ),
        const SizedBox(height: 16),
        DropdownButton<DriveProvider>(
          items: isRCloneBackend.value
              ? DriveProvider.allProviders
                    .filter((provider) => provider.defaultBackend is! Local)
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.displayName),
                      ),
                    )
                    .toList()
              : DriveProvider.allProviders
                    .filter((e) => e.defaultBackend is OAuth2)
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.displayName),
                      ),
                    )
                    .toList(),
          value: selected.value,
          isExpanded: true,
          onChanged: (DriveProvider? e) {
            selected.value = e!;
          },
        ),
        if (isRCloneBackend.value)
          ...switch (selected.value.defaultBackend) {
            OAuth2() => [],
            S3() => [
              const SizedBox(height: 16),
              TextField(
                controller: _urlController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Provider URL',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _userController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Access Key ID',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Secret Access Key',
                ),
              ),
            ],
            UserPassword() => [
              const SizedBox(height: 16),
              TextField(
                controller: _userController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ],
            Webdav() => [
              const SizedBox(height: 16),
              TextField(
                controller: _urlController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Provider URL',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _userController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ],
            Local() => [],
          },
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: () async {
            if (!authController.isLoading) {
              final valid = switch (selected.value.defaultBackend) {
                OAuth2() => validateControllers([_remoteNameController]),
                S3() => validateControllers([
                  _remoteNameController,
                  _urlController,
                  _userController,
                  _passwordController,
                ]),
                UserPassword() => validateControllers([
                  _remoteNameController,
                  _userController,
                  _passwordController,
                ]),
                Webdav() => validateControllers([
                  _remoteNameController,
                  _urlController,
                  _userController,
                  _passwordController,
                ]),
                Local() =>
                  validateControllers([_remoteNameController]) &&
                      validateSelectedFolder(selectedFolder.value),
              };

              if (valid) {
                await ref
                    .read(authControllerProvider.notifier)
                    .signIn(
                      switch (selected.value.defaultBackend) {
                        // Create defaults for OAuth2 as OAuth2 requires additional user auth
                        OAuth2 backend => backend,
                        UserPassword() => UserPassword(
                          username: _userController.text,
                          password: _passwordController.text,
                        ),
                        S3() => S3(
                          url: _urlController.text,
                          accessKeyId: _userController.text,
                          secretAccessKey: _passwordController.text,
                        ),
                        Webdav() => Webdav(
                          url: _urlController.text,
                          user: _userController.text,
                          password: _passwordController.text,
                        ),
                        Local() => Local(
                          folderPath: selectedFolder.value.toNullable()!,
                        ),
                      },
                      selected.value,
                      _remoteNameController.text,
                      isRCloneBackend.value,
                    );

                if (context.mounted && !authController.isLoading) {
                  Navigator.of(context).pop();
                }
              } else {
                context.showErrorSnackBar('Invalid fields entered');
              }
            }
          },
          child: authController.isLoading
              ? const SizedBox.square(
                  dimension: 20.0,
                  child: CircularProgressWidget(size: 300),
                )
              : const Text('Submit'),
        ),
      ],
    );
  }
}
