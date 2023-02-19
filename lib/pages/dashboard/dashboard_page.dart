import 'package:flutter/material.dart';

import '../../common/app_responsive.dart';
import '../../constants/resources/colors.dart';
import 'widgets/dashboard_header.dart';
import 'widgets/input_data_card.dart';
import 'widgets/output_image_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: context.colors.bgDashboard,
        borderRadius: BorderRadius.circular(20),
      ),
      child: (AppResponsive.isDesktop(context))
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DashboardHeader(),
                Expanded(
                  child: Row(
                    children: const [
                      Expanded(
                        child: InputDataCard(),
                      ),
                      Expanded(
                        child: OutputImageCard(),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Flexible(
                  child: InputDataCard(),
                ),
                Flexible(
                  child: OutputImageCard(),
                ),
              ],
            ),
    );
  }
}
