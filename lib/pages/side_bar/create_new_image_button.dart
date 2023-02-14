import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/app_texts.dart';
import '../../constants/resources/colors.dart';
import '../dashboard/dashboard_view_model.dart';

class CreateNewImageButton extends ConsumerWidget {
  const CreateNewImageButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton.icon(
        onPressed: () {
          ref.read(dashboardViewModelProvider.notifier).resetData();
        },
        icon: const Icon(Icons.add),
        label: const Text(AppTexts.btn1),
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
          foregroundColor: AppColors.white,
          side: const BorderSide(color: AppColors.lightGrey),
        ),
      ),
    );
  }
}
