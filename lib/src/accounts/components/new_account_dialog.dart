import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/helpers.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/src/common/components/circular_progress_widget.dart';
import 'package:syncvault/src/common/models/drive_provider.dart';
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
    return controllers.all((val) => val.text.isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    final selected = useState(DriveProvider.oneDrive);
    final isRCloneBackend = useState(!Platform.isIOS);
    final authController = ref.watch(authControllerProvider);

    ref.listen<AsyncValue>(authControllerProvider, (prev, state) {
      if (!state.isLoading && state.hasError) {
        context.showErrorSnackBar(
          state.error!
              .handleError(
                'Auth controller failed',
                state.stackTrace ?? StackTrace.empty,
              )
              .message,
        );
      }
    });

    return SimpleDialog(
      title: const Text('Register a new drive account'),
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
                  selected.value = DriveProvider.oneDrive;
                },
              ),
            ],
          ),
        const SizedBox(height: 16),
        DropdownButton<DriveProvider>(
          items:
              isRCloneBackend.value
                  ? DriveProvider.values
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.displayName),
                        ),
                      )
                      .toList()
                  : DriveProvider.values
                      .filter((e) => e.backendType == OAuth2)
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
          ...switch (selected.value.backendType) {
            const (OAuth2) => [],
            const (S3) => [
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
            const (UserPassword) => [
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
            const (Webdav) => [
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
            _ => [],
          },
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: () async {
            if (!authController.isLoading) {
              final valid = switch (selected.value.backendType) {
                const (OAuth2) => validateControllers([_remoteNameController]),
                const (S3) => validateControllers([
                  _remoteNameController,
                  _urlController,
                  _userController,
                  _passwordController,
                ]),
                const (UserPassword) => validateControllers([
                  _remoteNameController,
                  _userController,
                  _passwordController,
                ]),
                const (Webdav) => validateControllers([
                  _remoteNameController,
                  _urlController,
                  _userController,
                  _passwordController,
                ]),
                _ => false,
              };

              if (valid) {
                await ref
                    .read(authControllerProvider.notifier)
                    .signIn(
                      switch (selected.value.backendType) {
                        // Create defaults for OAuth2 as OAuth2 requires additional user auth
                        const (OAuth2) => const OAuth2(
                          authJson: {},
                          accessToken: '',
                          refreshToken: '',
                          expiresIn: '',
                        ),
                        const (UserPassword) => UserPassword(
                          username: _userController.text,
                          password: _passwordController.text,
                        ),
                        const (S3) => S3(
                          url: _urlController.text,
                          accessKeyId: _userController.text,
                          secretAccessKey: _passwordController.text,
                        ),
                        const (Webdav) => Webdav(
                          url: _urlController.text,
                          user: _userController.text,
                          password: _passwordController.text,
                        ),
                        _ =>
                          throw const GeneralError(
                            'Backend not supported',
                          ), // TODO:
                      },
                      selected.value,
                      _remoteNameController.text,
                      isRCloneBackend.value,
                    );

                if (context.mounted && !authController.isLoading) {
                  Navigator.of(context).pop();
                }
              } else {
                throw const GeneralError('Fields are empty'); // TODO:
              }
            }
          },
          child:
              authController.isLoading
                  ? const SizedBox.square(
                    dimension: 20.0,
                    child: CircularProgressWidget(size: 300, isInfinite: true),
                  )
                  : const Text('Submit'),
        ),
      ],
    );
  }
}
