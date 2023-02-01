import 'package:flutter/material.dart';
import 'constants/resources/colors.dart';

import 'home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'image generator',
      theme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        drawerTheme: const DrawerThemeData(
          backgroundColor: AppColors.bgSidebarLeft,
        ),
      ),
      home: const HomePage(),
    );
  }
}
