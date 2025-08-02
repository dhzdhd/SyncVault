import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncvault/src/accounts/components/delete_account_dialog.dart';
import 'package:syncvault/src/accounts/components/drive_info_dialog.dart';
import 'package:syncvault/src/home/models/drive_provider_backend.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({
    super.key,
    required this.textTheme,
    required this.providerModel,
  });

  final TextTheme textTheme;
  final DriveProviderModel providerModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                spacing: 10,
                children: [
                  Badge(backgroundColor: Colors.green),
                  Tooltip(
                    message: providerModel.provider.displayName,
                    child: SvgPicture.asset(
                      providerModel.provider.providerIcon,
                      width: MediaQuery.of(context).size.width < 500 ? 50 : 70,
                      height: MediaQuery.of(context).size.width < 500 ? 50 : 70,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width < 500
                            ? 2.0
                            : 5.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 3,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                providerModel.remoteName,
                                style: MediaQuery.of(context).size.width < 500
                                    ? textTheme.titleLarge
                                    : textTheme.headlineSmall,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondaryContainer,
                                ),
                                padding: const EdgeInsets.only(
                                  left: 6,
                                  right: 6,
                                ),
                                child: Text(switch (providerModel.backend
                                    is Local) {
                                  true => 'Local',
                                  false =>
                                    providerModel.isRCloneBackend
                                        ? 'RClone'
                                        : 'Manual',
                                }),
                              ),
                            ],
                          ),
                          Text(switch (providerModel.backend) {
                            Local(:final folderPath) => folderPath,
                            OAuth2(:final parentPath) =>
                              '$parentPath/${providerModel.folderName}',
                            _ => 'Unknown path',
                          }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
                                    DriveInfoDialogWidget(model: providerModel),
                              ),
                            },
                        },
                      );
                    },
                  ),
                PopupMenuItem(
                  child: const Row(
                    children: [Text('Delete'), Spacer(), Icon(Icons.delete)],
                  ),
                  onTap: () async {
                    if (context.mounted) {
                      await showDialog(
                        context: context,
                        builder: (ctx) =>
                            DeleteAccountDialogWidget(model: providerModel),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
