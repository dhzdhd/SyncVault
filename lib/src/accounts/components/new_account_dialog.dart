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
    final authController = ref.watch(authControllerProvider);

    ref.listen<AsyncValue>(
      authControllerProvider,
      (prev, state) {
        if (!state.isLoading && state.hasError) {
          context.showErrorSnackBar(
            state.error!
                .handleError('Auth controller failed',
                    state.stackTrace ?? StackTrace.empty)
                .message,
          );
        }
      },
    );

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
        DropdownButton<DriveProvider>(
          items: DriveProvider.values
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
        // if (!Platform.isIOS)
        //   // IOS only supports manual
        //   Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       const Text(
        //         'Set RClone as default backend',
        //         style: TextStyle(
        //           fontSize: 20,
        //           fontWeight: FontWeight.w400,
        //         ),
        //       ),
        //       Switch(
        //         value: settings.isRCloneDefault,
        //         onChanged: (val) {
        //           settingsNotifier.setRCloneDefaultBackend();
        //         },
        //       )
        //     ],
        //   ),
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
                    _passwordController
                  ]),
                const (UserPassword) => validateControllers([
                    _remoteNameController,
                    _userController,
                    _passwordController
                  ]),
                const (Webdav) => validateControllers([
                    _remoteNameController,
                    _urlController,
                    _userController,
                    _passwordController
                  ]),
                _ => false
              };

              if (valid) {
                await ref.read(authControllerProvider.notifier).signIn(
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
                        _ => throw const GeneralError(
                            'Backend not supported'), // TODO:
                      },
                      selected.value,
                      _remoteNameController.text,
                    );

                if (context.mounted && !authController.isLoading) {
                  Navigator.of(context).pop();
                }
              } else {
                throw const GeneralError('Fields are empty'); // TODO:
              }
            }
          },
          child: authController.isLoading
              ? const SizedBox.square(
                  dimension: 20.0,
                  child: CircularProgressWidget(size: 300, isInfinite: true),
                )
              : const Text('Submit'),
        )
      ],
    );
  }
}
