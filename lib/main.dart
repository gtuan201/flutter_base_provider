import 'dart:io';

import 'package:code_base_provider_flutter/utils/text_theme.dart';
import 'package:flutter/material.dart';

import 'l10n/localizations.dart';
import 'locator.dart';
import 'res/style/app_colors.dart';
import 'services/shared_pref_service.dart';
import 'utils/dimens/dimens_manager.dart';
import 'utils/routes/routes.dart';
import 'utils/routes/routes_name.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization(null);
  HttpOverrides.global = MyHttpOverrides();

  setupLocator();

  SharedPrefService.instance.onInit();

  runApp(const MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 4));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    DimensManager();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Code Base',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        textTheme: TextThemeData.textTheme,
        colorScheme:
            ThemeData().colorScheme.copyWith(primary: AppColors.primaryColor),
      ),
      navigatorObservers: [routeObserver],
      initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.routeBuilder,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..maxConnectionsPerHost = 5
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
