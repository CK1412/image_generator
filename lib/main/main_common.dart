import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import '../app.dart';
import '../data/databases/hive/hive_client.dart';
import '../data/providers/app_flavor_provider.dart';
import 'app_flavor.dart';

void mainCommon(AppFlavor appFlavor) async {
  Future<void> startApp() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    if (!kIsWeb) {
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    }

    usePathUrlStrategy();

    String apiKey = '';

    if (appFlavor.appFlavorType.isProduction) {
      apiKey = const String.fromEnvironment('API_KEY');
    } else {
      await dotenv.load(fileName: '.env');
      apiKey = dotenv.env['API_KEY']!;
    }

    appFlavor = appFlavor.copyWith(
      apiConfig: appFlavor.apiConfig.copyWith(apiKey: apiKey),
    );

    await HiveClient.init();

    runApp(
      ProviderScope(
        overrides: [
          appFlavorProvider.overrideWithValue(appFlavor),
        ],
        child: App(
          appFlavor: appFlavor,
        ),
      ),
    );

    if (!kIsWeb) {
      FlutterNativeSplash.remove();
    }
  }

  runZonedGuarded(
    () => startApp(),
    (error, stack) {
      if (kDebugMode) {
        debugPrintStack(stackTrace: stack);
      }
    },
  );
}
