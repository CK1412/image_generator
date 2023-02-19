import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants/constants.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/app_texts.dart';
import '../../../constants/resources/animations.dart';
import '../../../constants/resources/icons.dart';
import '../dashboard_view_model.dart';

class ImageBox extends ConsumerWidget {
  const ImageBox({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardState = ref.watch(dashboardViewModelProvider);

    final isGeneratingImage = dashboardState.isGeneratingImage;

    return Align(
      alignment: Alignment.topCenter,
      child: LimitedBox(
        maxHeight: Constants.maxSizeImage,
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: isGeneratingImage
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FractionallySizedBox(
                        widthFactor: 0.2,
                        child: Lottie.asset(
                          AppAnimations.lottieDrawingPencil,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Text(
                        AppTexts.description2,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                : const ImageDisplayed(),
          ),
        ),
      ),
    );
  }
}

class ImageDisplayed extends ConsumerWidget {
  const ImageDisplayed({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardState = ref.watch(dashboardViewModelProvider);

    final tempImage = dashboardState.tempImage;

    if (tempImage == null) {
      return SvgPicture.asset(
        AppIcons.svgPicture,
        fit: BoxFit.scaleDown,
      );
    }
    //
    else {
      return Image.memory(
        tempImage.bytes,
        fit: BoxFit.cover,
      );
    }
  }
}
