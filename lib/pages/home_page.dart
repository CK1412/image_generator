import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/app_responsive.dart';
import '../constants/app_texts.dart';
import '../constants/resources/colors.dart';
import '../constants/resources/text_styles.dart';
import 'dashboard/dashboard_page.dart';
import 'dashboard/dashboard_view_model.dart';
import 'side_bar/side_bar_left.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});
  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: const Text(
        AppTexts.title1,
        style: AppTextStyles.textMedium20,
      ),
    );

    return IgnorePointer(
      ignoring: ref.watch(dashboardViewModelProvider).isFreezedUI,
      child: SafeArea(
        child: Scaffold(
          appBar: AppResponsive.isDesktop(context) ? null : appBar,
          key: _scaffoldKey,
          drawer: const SidebarLeft(),
          backgroundColor: context.colors.bgSidebarLeft,
          body: AppResponsive.isDesktop(context)
              ? Row(
                  children: const [
                    Expanded(
                      child: SidebarLeft(),
                    ),
                    Expanded(
                      flex: 5,
                      child: DashboardPage(),
                    ),
                  ],
                )
              : const DashboardPage(),
        ),
      ),
    );
  }
}
