import 'package:flutter/material.dart';

import '../../../constants/app_texts.dart';
import '../../../constants/resources/colors.dart';
import '../../../constants/resources/text_styles.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16),
      child: Text(
        AppTexts.title1,
        style: AppTextStyles.textMedium20.copyWith(
          color: context.colors.textOnBgDashboard,
          letterSpacing: 0.4,
        ),
      ),
    );
  }
}
