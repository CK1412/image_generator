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
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          ImageBox(),
          ControlBox(),
        ],
      ),
    );
  }
}

class ControlBox extends ConsumerStatefulWidget {
  const ControlBox({super.key});

  @override
  ConsumerState createState() => _ControlBoxState();
}

class _ControlBoxState extends ConsumerState<ControlBox> {
  @override
  Widget build(BuildContext context) {
    final dashboardState = ref.watch(dashboardViewModelProvider);

    final imageUrl = dashboardState.imageUrl;

    return Visibility(
      visible: imageUrl != null,
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        constraints: const BoxConstraints(
          maxWidth: 512,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Download button
            ControlButton(
              onTap: _downloadImage,
              child: const Icon(Icons.download_rounded),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _downloadImage() async {
    final dashboardState = ref.watch(dashboardViewModelProvider);

    final imageUrl = dashboardState.imageUrl;

    final imageName = dashboardState.imageName;

    if (imageUrl == null) {
      return;
    }

    await ref
        .read(dashboardViewModelProvider.notifier)
        .downloadImage(imageUrl, imageName!);
  }
}
