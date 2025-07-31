import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/components/delete_account_dialog.dart';
import 'package:syncvault/src/accounts/components/drive_info_dialog.dart';
import 'package:syncvault/src/accounts/components/new_account_dialog.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/common/components/sliver_animated_app_bar.dart';
import 'package:syncvault/src/home/models/drive_provider_backend.dart';

class AccountView extends ConsumerWidget {
  const AccountView({super.key});

  static const routeName = '/accounts';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authInfo = ref.watch(authProvider).requireValue;
    final textTheme = Theme.of(context).textTheme;

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
              delegate: SliverChildListDelegate.fixed(
                authInfo
                    .map(
                      (providerModel) => Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Tooltip(
                                    message: providerModel.provider.displayName,
                                    child: SvgPicture.asset(
                                      providerModel.provider.providerIcon,
                                      width:
                                          MediaQuery.of(context).size.width <
                                              500
                                          ? 50
                                          : 70,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left:
                                          MediaQuery.of(context).size.width <
                                              500
                                          ? 10.0
                                          : 32.0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          providerModel.remoteName,
                                          style:
                                              MediaQuery.of(
                                                    context,
                                                  ).size.width <
                                                  500
                                              ? textTheme.titleLarge
                                              : textTheme.headlineSmall,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                        Row(
                                          spacing: 6,
                                          children: [
                                            Text(
                                              providerModel
                                                  .provider
                                                  .displayName,
                                              style:
                                                  MediaQuery.of(
                                                        context,
                                                      ).size.width <
                                                      500
                                                  ? textTheme.bodyMedium
                                                  : textTheme.bodyLarge,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondaryContainer,
                                              ),
                                              padding: const EdgeInsets.only(
                                                left: 6,
                                                right: 6,
                                              ),
                                              child: Text(
                                                providerModel.isRCloneBackend
                                                    ? 'RClone'
                                                    : 'Manual',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              PopupMenuButton(
                                itemBuilder: (ctx) => [
                                  // TODO: Perhaps show drive info for local too??
                                  if (providerModel.backend is! Local)
                                    PopupMenuItem(
                                      child: const Row(
                                        children: [
                                          Text('Info'),
                                          Spacer(),
                                          Icon(Icons.info_outline),
                                        ],
                                      ),
                                      onTap: () async {
                                        await Future.delayed(
                                          Duration.zero,
                                          () => {
                                            if (context.mounted)
                                              {
                                                showDialog(
                                                  context: context,
                                                  builder: (ctx) =>
                                                      DriveInfoDialogWidget(
                                                        model: providerModel,
                                                      ),
                                                ),
                                              },
                                          },
                                        );
                                      },
                                    ),
                                  PopupMenuItem(
                                    child: const Row(
                                      children: [
                                        Text('Delete'),
                                        Spacer(),
                                        Icon(Icons.delete),
                                      ],
                                    ),
                                    onTap: () async {
                                      if (context.mounted) {
                                        await showDialog(
                                          context: context,
                                          builder: (ctx) =>
                                              DeleteAccountDialogWidget(
                                                model: providerModel,
                                              ),
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
