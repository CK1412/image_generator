import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/resources/colors.dart';
import '../dashboard_view_model.dart';
import 'control_button.dart';
import 'image_box.dart';

class OutputImageCard extends StatelessWidget {
  const OutputImageCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: const [
          Flexible(
            child: ImageBox(),
          ),
          SizedBox(
            height: 20,
          ),
          ControlBox(),
        ],
      ),
    );
  }
}

class ControlBox extends ConsumerWidget {
  const ControlBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardState = ref.watch(dashboardViewModelProvider);

    final imageUrl = dashboardState.imageUrl;

    return Visibility(
      visible: imageUrl != null,
      replacement: const SizedBox(height: 32),
      child: SizedBox(
        width: 512,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Download button
            ControlButton(
              onTap: () async {},
              child: const Icon(Icons.download_rounded),
            )
          ],
        ),
      ),
    );
  }
}
