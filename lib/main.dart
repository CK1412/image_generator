import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'common/my_custom_scroll_behavior.dart';
import 'constants/resources/colors.dart';
import 'data/databases/hive/hive_boxes.dart';
import 'data/databases/hive/hive_client.dart';
import 'data/providers/hive_client_provider.dart';
import 'pages/home_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  usePathUrlStrategy();

  await dotenv.load(fileName: '.env');

  await HiveClient.init();

  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ValueListenableBuilder(
      valueListenable: ref.watch(hiveClientProvider).darkModeBox.listenable(),
      builder: (context, box, child) {
        final bool isDarkMode = box.get(
              DarkModeKey.darkMode,
              defaultValue: false,
            ) ??
            false;

        return MaterialApp(
          title: 'image generator',
          themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeData(useMaterial3: true).copyWith(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primaryColor: context.colors.green,
            colorScheme: isDarkMode
                ? const ColorScheme.dark().copyWith(
                    primary: context.colors.green,
                  )
                : const ColorScheme.light().copyWith(
                    primary: context.colors.green,
                  ),
            brightness: isDarkMode ? Brightness.dark : Brightness.light,
            drawerTheme: DrawerThemeData(
              backgroundColor: context.colors.bgSidebarLeft,
            ),
          ),
          scrollBehavior: MyCustomScrollBehavior(),
          home: const HomePage(),
        );
      },
    );
  }
}
