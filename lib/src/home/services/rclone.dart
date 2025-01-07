import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/helpers.dart';
import 'package:syncvault/log.dart';
import 'package:syncvault/src/accounts/models/drive_info_model.dart';
import 'package:syncvault/src/accounts/models/file_model.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/src/home/models/drive_provider_backend.dart';
import 'package:syncvault/src/home/models/drive_provider_backend_payload.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';
import 'package:syncvault/src/home/services/rclone_template.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:ini_v2/ini.dart';

final _dio = GetIt.I<Dio>();

enum DriveProvider {
  oneDrive('onedrive', 'OneDrive', 'assets/logos/onedrive.svg', OAuth2),
  googleDrive('drive', 'Google Drive', 'assets/logos/gdrive.svg', OAuth2),
  dropBox('dropbox', 'Dropbox', 'assets/logos/dropbox.svg', OAuth2),
  // TODO: Change logo (make bigger)
  protonDrive('protondrive', 'Proton Drive', 'assets/logos/protondrive.svg',
      UserPassword),
  minio('s3', 'Minio', 'assets/logos/minio.svg', S3),
  nextCloud('webdav', 'NextCloud', 'assets/logos/nextcloud.svg', Webdav);

  Option<Map<String, String>> template({
    required DriveProviderBackend backend,
  }) {
    return Option.fromNullable(providerTemplate[this])
        .map((func) => func(backend));
  }

  const DriveProvider(
      this.providerName, this.displayName, this.providerIcon, this.backend);

  final String providerName;
  final String displayName;
  final String providerIcon;
  // TODO: Somehow relate to DriveProviderBackend without switch case
  final Type backend;
}

@singleton
class RCloneUtils {
  TaskEither<AppError, String> getRCloneExec() {
    return TaskEither.tryCatch(() async {
      if (Platform.isAndroid) {
        const channel = MethodChannel('com.example.syncvault/native_lib');
        final path = await channel.invokeMethod('getNativeLibraryPath');
        return '$path/librclone.so';
      } else if (Platform.isWindows) {
        final docDir = await getApplicationDocumentsDirectory();
        return File('${docDir.path}/SyncVault/rclone.exe').path;
      } else if (Platform.isLinux || Platform.isMacOS) {
        final docDir = await getApplicationDocumentsDirectory();
        return File('${docDir.path}/SyncVault/rclone').path;
      } else if (Platform.isIOS) {
        throw UnimplementedError('RClone not implemented in iOS yet');
      } else {
        throw UnimplementedError('This platform is not supported yet');
      }
    }, (err, stackTrace) {
      debugLogger.e(stackTrace);
      return err.segregateError();
    });
  }

  TaskEither<AppError, File> getConfig() {
    return TaskEither.tryCatch(() async {
      late final File configFile;

      if (PlatformExtension.isDesktop) {
        final docDir = await getApplicationDocumentsDirectory();
        configFile = File('${docDir.path}/SyncVault/rclone.conf');
      } else if (PlatformExtension.isMobile) {
        final docDir = await getApplicationDocumentsDirectory();
        configFile = File('${docDir.path}/SyncVault/rclone.conf');
      } else {
        throw const GeneralError('Platform not supported');
      }

      if (!(await configFile.exists())) {
        await configFile.create(recursive: true);
      }

      return configFile;
    }, (err, stackTrace) {
      debugLogger.e(stackTrace);
      return err.segregateError();
    });
  }

  TaskEither<AppError, List<String>> getConfigArgs() {
    return getConfig().map((file) => ['--config', file.path]);
  }
}

@singleton
class RCloneAuthService {
  TaskEither<AppError, DriveProviderModel> authorize({
    required DriveProviderBackendPayload payload,
    required DriveProvider driveProvider,
  }) {
    final utils = RCloneUtils();

    return TaskEither<AppError, DriveProviderModel>.Do(($) async {
      final execPath = await $(utils.getRCloneExec());
      final configFile = await $(utils.getConfig());

      // Authorize with rclone for given provider
      final model = switch (driveProvider.backend) {
        const (OAuth2) => await $(
            TaskEither.tryCatch(
              () async {
                payload = payload as OAuth2Payload;

                print(driveProvider.providerName);
                final process = await Process.start(
                  execPath,
                  [
                    'authorize',
                    '--auth-no-open-browser',
                    driveProvider.providerName
                  ],
                  runInShell: true,
                );

                final output = StringBuffer();
                final errorOutput = StringBuffer();
                final urlPattern = RegExp(
                    r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)');

                // Listen to stdout, stderr
                process.stdout.transform(utf8.decoder).listen((data) {
                  output.write(data);
                });
                process.stderr.transform(utf8.decoder).listen((data) {
                  errorOutput.write(data);

                  // Match url with regex (url is in stderr for whatever reason)
                  final match = urlPattern.firstMatch(data);
                  if (match != null) {
                    final url = match.group(0);
                    if (url != null) {
                      launchUrlString(url);
                    }
                  }
                });

                // Wait for process to finish
                await process.exitCode;

                print(output);
                print(errorOutput);
                final Map<String, dynamic> authJson = jsonDecode(
                    RegExp(r'\{.+\}').stringMatch(output.toString())!);
                if (authJson
                    case {
                      'access_token': String accessToken,
                      'refresh_token': String refreshToken,
                      'expiry': String expiresIn,
                    }) {
                  final model = DriveProviderModel(
                    remoteName: payload.remoteName,
                    provider: driveProvider,
                    backend: OAuth2(
                      rCloneJson: authJson,
                      accessToken: accessToken,
                      refreshToken: refreshToken,
                      expiresIn: expiresIn,
                    ),
                  );

                  return model;
                } else {
                  throw const GeneralError('Authorization response invalid');
                }
              },
              (err, stackTrace) {
                debugLogger.e(stackTrace);
                return err.segregateError();
              },
            ),
          ),
        const (S3) => await $(
            TaskEither.tryCatch(
              () async {
                final s3Payload = payload as S3Payload;

                final model = DriveProviderModel(
                  remoteName: payload.remoteName,
                  provider: driveProvider,
                  backend: S3(
                    url: s3Payload.url,
                    accessKeyId: s3Payload.accessKeyId,
                    secretAccessKey: s3Payload.secretAccessKey,
                  ),
                );

                return model;
              },
              (err, stackTrace) {
                debugLogger.e(stackTrace);
                return err.segregateError();
              },
            ),
          ),
        const (UserPassword) => await $(
            TaskEither.tryCatch(
              () async {
                final userPassPayload = payload as UserPasswordPayload;

                // Password needs to be obscured by rclone for usage
                final process = await Process.run(
                    execPath, ['obscure', userPassPayload.password]);
                final obscPassword = process.stdout;

                final model = DriveProviderModel(
                  remoteName: payload.remoteName,
                  provider: driveProvider,
                  backend: UserPassword(
                    username: userPassPayload.username,
                    password: obscPassword,
                  ),
                );

                return model;
              },
              (err, stackTrace) {
                debugLogger.e(stackTrace);
                return err.segregateError();
              },
            ),
          ),
        const (Webdav) => await $(
            TaskEither.tryCatch(
              () async {
                final webdavPayload = payload as WebdavPayload;

                // Password needs to be obscured by rclone for usage
                final process = await Process.run(
                    execPath, ['obscure', webdavPayload.password]);
                final obscPassword = process.stdout;

                final model = DriveProviderModel(
                  remoteName: payload.remoteName,
                  provider: driveProvider,
                  backend: Webdav(
                    url: webdavPayload.url,
                    user: webdavPayload.user,
                    password: obscPassword,
                  ),
                );

                return model;
              },
              (err, stackTrace) {
                debugLogger.e(stackTrace);
                return err.segregateError();
              },
            ),
          ),
        // TODO: Do not throw in a Do()
        _ => throw UnimplementedError('Selected provider does not work yet')
      };

      // Write rclone output to rclone config file
      await $(
        TaskEither.tryCatch(
          () async {
            final toWrite =
                driveProvider.template(backend: model.backend).getOrElse(
                      () => throw const GeneralError(
                          'Unable to fetch template for given provider.'),
                    );

            // OneDrive requires drive ID which is not provided by rclone
            if (model.provider == DriveProvider.oneDrive) {
              final backend = model.backend as OAuth2;
              final response =
                  await _dio.get('https://graph.microsoft.com/v1.0/me/drive',
                      options: Options(headers: {
                        'Authorization': 'Bearer ${backend.accessToken}',
                        'Content-Type': 'application/json',
                      }));
              if (response.statusCode != 200) {
                throw const HttpError(
                    'Microsoft Graph API cannot be accessed right now.');
              }

              final driveId = response.data['id'];
              toWrite['drive_id'] = driveId;
            }

            final iniConfig =
                Config.fromString(await configFile.readAsString());
            iniConfig.add(model.remoteName, toWrite);

            await configFile.writeAsString(iniConfig.toString());
          },
          (err, stackTrace) => err.segregateError(),
        ),
      );

      return model;
    });
  }

  TaskEither<AppError, Option<DriveInfoModel>> driveInfo(
      {required DriveProviderModel model}) {
    final utils = RCloneUtils();

    return TaskEither<AppError, Option<DriveInfoModel>>.Do(($) async {
      final execPath = await $(utils.getRCloneExec());
      final configArgs = await $(utils.getConfigArgs());

      return await $(TaskEither.tryCatch(
        () async {
          final process = await Process.run(
            execPath,
            [
              ...configArgs,
              'about',
              '--json',
              '--full',
              '${model.remoteName}:'
            ],
          );

          if (process.stderr.toString().trim().isNotEmpty) {
            debugLogger.e(process.stderr.toString());
          }

          final output = process.stdout.toString();

          if (output.trim().isEmpty) {
            return none();
          }

          final json = jsonDecode(output);

          return some(DriveInfoModel(
            remainingStorage: Option.fromNullable(json['free']),
            usedStorage: Option.fromNullable(json['used']),
            totalStorage: Option.fromNullable(json['total']),
          ));
        },
        (err, stackTrace) => err.segregateError(),
      ));
    });
  }
}

@singleton
class RCloneDriveService {
  TaskEither<AppError, FolderModel> create({
    required DriveProviderModel model,
    required String folderPath,
    required String folderName,
    String remoteParentPath = 'SyncVault/',
  }) {
    final utils = RCloneUtils();

    return TaskEither<AppError, FolderModel>.Do(($) async {
      final execPath = await $(utils.getRCloneExec());
      final configArgs = await $(utils.getConfigArgs());

      await $(TaskEither.tryCatch(() async {
        // TODO: S3 only allows bucket name, not path
        final process = await Process.run(execPath, [
          ...configArgs,
          'mkdir',
          '${model.remoteName}:/$remoteParentPath$folderName'
        ]);

        if (process.stderr.toString().trim().isNotEmpty) {
          debugLogger.e(process.stderr);
        }

        return ();
      }, (err, stackTrace) => err.segregateError()));

      final folderModel = FolderModel(
        remoteName: model.remoteName,
        provider: model.provider,
        folderPath: folderPath,
        folderName: folderName,
        remoteParentPath: remoteParentPath,
        isAutoSync: false,
        isDeletionEnabled: false,
        isTwoWaySync: false,
      );
      return folderModel;
    });
  }

  TaskEither<AppError, ()> upload({
    required DriveProviderModel providerModel,
    required FolderModel folderModel,
    required String localPath,
  }) {
    final utils = RCloneUtils();

    return TaskEither<AppError, ()>.Do(($) async {
      final execPath = await $(utils.getRCloneExec());
      final configArgs = await $(utils.getConfigArgs());

      final res = await $(TaskEither.tryCatch(() async {
        final process = await Process.run(execPath, [
          ...configArgs,
          'sync',
          localPath,
          '${folderModel.remoteName}:/${folderModel.remoteParentPath}${folderModel.folderName}'
        ]);

        if (process.stderr.toString().trim().isNotEmpty) {
          debugLogger.e(process.stderr.toString());
        }

        return ();
      }, (err, stackTrace) => err.segregateError()));

      return res;
    });
  }

  TaskEither<AppError, ()> delete({
    required DriveProviderModel providerModel,
    required FolderModel folderModel,
  }) {
    final utils = RCloneUtils();
    // FIXME:

    return TaskEither<AppError, ()>.Do(($) async {
      final execPath = await $(utils.getRCloneExec());
      final configArgs = await $(utils.getConfigArgs());

      final res = await $(TaskEither.tryCatch(() async {
        final process = await Process.run(execPath, [
          ...configArgs,
          'purge',
          '${folderModel.remoteName}:/${folderModel.remoteParentPath}${folderModel.folderName}'
        ]);

        if (process.stderr.toString().trim().isNotEmpty) {
          debugLogger.e(process.stderr.toString());
        }

        return ();
      }, (err, stackTrace) => err.segregateError()));

      return res;
    });
  }

  TaskEither<AppError, Option<FileModel>> treeView({
    required FolderModel model,
  }) {
    final utils = RCloneUtils();

    return TaskEither<AppError, Option<FileModel>>.Do(($) async {
      final execPath = await $(utils.getRCloneExec());
      final configArgs = await $(utils.getConfigArgs());

      final Option<FileModel> fileModel = await $(TaskEither.tryCatch(() async {
        final process = await Process.run(execPath, [
          ...configArgs,
          'tree',
          '-a',
          '--dirsfirst',
          '--full-path',
          '-s',
          '-Q',
          '${model.remoteName}:/${model.remoteParentPath}${model.folderName}'
        ]);

        if (process.stderr.toString().trim().isNotEmpty) {
          debugLogger.e(process.stderr.toString());
        }

        final List<List<String>> matches = [];
        final output = process.stdout.toString();
        final lines = output.split('\n');

        // String is of the pattern - <garbage value> [     123]  "<path>"
        final regex = RegExp(r'\[\s*(\d+)\s*\]\s*\"([^\"]+)\"', dotAll: true);
        for (final line in lines) {
          final matched = regex
              .allMatches(line)
              .toList()
              .map((t) => t.groups([1, 2]))
              .firstOrNull;
          if (matched != [] && matched != null) {
            matches.add([matched[0]!, matched[1]!.replaceAll('\\', '/')]);
          }
        }

        final done = [];
        FileModel buildFileTree(
          List<List<String>> paths,
          String currentPath,
          String currentSize,
          Option<Directory> parent,
        ) {
          // Get the name of the current path
          final currentSegments =
              currentPath.split('/').where((seg) => seg.isNotEmpty).toList();
          final currentName =
              currentSegments.isEmpty ? '/' : currentSegments.last;

          // Find direct children of the current path
          final childrenPaths = paths.where((path) {
            final segments =
                path[1].split('/').where((seg) => seg.isNotEmpty).toList();
            return segments.length > currentSegments.length &&
                List.generate(currentSegments.length, (i) => segments[i])
                        .join('/') ==
                    currentSegments.join('/');
          }).toList();

          // Create child nodes recursively
          final List<FileModel> children = [];
          for (final childPath in childrenPaths) {
            final segments =
                childPath[1].split('/').where((seg) => seg.isNotEmpty).toList();
            final size = childPath[0];
            final childFullPath = segments.join('/');

            if (!done.contains(childFullPath)) {
              done.add(childFullPath);
              children.add(buildFileTree(
                  paths, childFullPath, size, some(Directory(currentPath))));
            }
          }

          // Determine if the current node is a file or directory
          final isFile = !paths.any((path) {
            final segments =
                path[1].split('/').where((seg) => seg.isNotEmpty).toList();
            return segments.length > currentSegments.length &&
                List.generate(currentSegments.length, (i) => segments[i])
                        .join('/') ==
                    currentSegments.join('/');
          });

          final fileEntity =
              isFile ? File(currentPath) : Directory(currentPath);

          return FileModel(
            name: currentName,
            size: currentSize,
            file: fileEntity,
            parent: parent.toNullable() ?? Directory(''),
            children: children,
          );
        }

        if (matches.isNotEmpty) {
          final model = buildFileTree(matches, '/', '0', none());
          return some(model);
        }

        return none();
      }, (err, stackTrace) => err.segregateError()));
      return fileModel;
    });
  }
}
