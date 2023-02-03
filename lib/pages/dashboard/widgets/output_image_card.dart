import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/resources/colors.dart';
import '../dashboard_view_model.dart';
import 'image_box.dart';

class OutputImageCard extends ConsumerStatefulWidget {
  const OutputImageCard({
    super.key,
  });

  @override
  ConsumerState createState() => _OutputImageCardState();
}

class _OutputImageCardState extends ConsumerState<OutputImageCard> {
  @override
  Widget build(BuildContext context) {
    final dashboardState = ref.watch(dashboardViewModelProvider);

    final imageUrl = dashboardState.currentImageUrl;

    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const ImageBox(),
          Visibility(
            visible: imageUrl != null,
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              constraints: const BoxConstraints(
                maxWidth: 400,
                maxHeight: 400,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: _downloadImage,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: AppColors.lightGrey,
                      ),
                      child: const Icon(Icons.download_rounded),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _downloadImage() {}
}
