import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/app_responsive.dart';
import '../../../constants/app_texts.dart';
import '../../../constants/resources/colors.dart';
import '../../../utils/utils.dart';
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
        color: context.colors.bgDashboardBox,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView(
        primary: false,
        shrinkWrap: AppResponsive.isDesktop(context) ? false : true,
        children: const [
          ImageBox(),
          SizedBox(
            height: 20,
          ),
          _ControlBox(),
        ],
      ),
    );
  }
}

class _ControlBox extends ConsumerStatefulWidget {
  const _ControlBox();

  @override
  ConsumerState createState() => _ControlBoxState();
}

class _ControlBoxState extends ConsumerState<_ControlBox> {
  @override
  Widget build(BuildContext context) {
    final dashboardState = ref.watch(dashboardViewModelProvider);

    final tempImage = dashboardState.tempImage;

    return Visibility(
      visible: tempImage != null,
      replacement: const SizedBox(height: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Download button
          ControlButton(
            onTap: _downloadImage,
            child: const Icon(Icons.download_rounded),
          ),
          const SizedBox(
            width: 10,
          ),
          // Share button
          ControlButton(
            onTap: _shareImage,
            child: const Icon(Icons.share_rounded),
          )
        ],
      ),
    );
  }

  Future<void> _downloadImage() async {
    await ref.read(dashboardViewModelProvider.notifier).downloadImage();

    if (context.mounted) {
      Utils.showSnackbar(context, text: AppTexts.notification1);
    }
  }

  Future<void> _shareImage() async {
    await ref.read(dashboardViewModelProvider.notifier).shareImage();
  }
}
