import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'constants/resources/colors.dart';
import 'data/databases/hive/hive_client.dart';
import 'home_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  await HiveClient.init();

  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'image generator',
      theme: ThemeData.light(
        useMaterial3: true,
      ).copyWith(
        primaryColor: AppColors.green,
        colorScheme: const ColorScheme.light().copyWith(
          primary: AppColors.green,
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: AppColors.bgSidebarLeft,
        ),
      ),
      home: const HomePage(),
    );
  }
}
