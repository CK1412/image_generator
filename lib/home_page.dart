import 'package:flutter/material.dart';
import 'constants/resources/colors.dart';

import 'pages/dashboard/dashboard_page.dart';
import 'widgets/side_bar_left.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgSidebarLeft,
      body: SafeArea(
        child: Row(
          children: const [
            Expanded(
              child: SidebarLeft(),
            ),
            Expanded(
              flex: 5,
              child: DashboardPage(),
            ),
          ],
        ),
      ),
    );
  }
}
