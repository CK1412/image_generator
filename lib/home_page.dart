import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/dashboard/dashboard_view_model.dart';

import 'constants/resources/colors.dart';
import 'pages/dashboard/dashboard_page.dart';
import 'widgets/side_bar_left.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IgnorePointer(
      ignoring: ref.watch(dashboardViewModelProvider).isGeneratingImage,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.bgSidebarLeft,
          body: Row(
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
      ),
    );
  }
}
