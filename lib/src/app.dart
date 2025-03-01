import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/views/account_view.dart';
import 'package:syncvault/src/introduction/controllers/intro_controller.dart';
import 'package:syncvault/src/introduction/views/intro_view.dart';

import 'home/views/home_view.dart';
import 'settings/controllers/settings_controller.dart';
import 'settings/views/settings_view.dart';

class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final introSettings = ref.watch(introSettingsProvider);

    return MaterialApp(
      restorationScopeId: 'app',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: settings.themeMode,
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            return switch (routeSettings.name) {
              SettingsView.routeName => const SettingsView(),
              HomeView.routeName => const HomeView(),
              AccountView.routeName => const AccountView(),
              IntroductionView.routeName => const IntroductionView(),
              _ => introSettings.alreadyViewed
                  ? const HomeView()
                  : const IntroductionView()
            };
          },
        );
      },
    );
  }
}
