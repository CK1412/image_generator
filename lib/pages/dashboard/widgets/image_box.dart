import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

    final imageUrl = dashboardState.imageUrl;
    final isGeneratingImage = dashboardState.isGeneratingImage;

    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 512,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          // color: Colors.amber,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: isGeneratingImage
                ? SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FractionallySizedBox(
                          widthFactor: 0.2,
                          child: Lottie.asset(
                            AppAnimations.lottieDrawingPencil,
                          ),
                        ),
                        const Text(
                          AppTexts.description2,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                : imageUrl == null
                    ? SvgPicture.asset(
                        AppIcons.svgPicture,
                      )
                    : CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.cover,
                        useOldImageOnUrlChange: true,
                        placeholder: (context, url) {
                          return Center(
                            child: Lottie.asset(AppAnimations.lottieLoading),
                          );
                        },
                        errorWidget: (context, url, error) {
                          return Center(
                            child: Lottie.asset(AppAnimations.lottieFailed),
                          );
                        },
                      ),
          ),
        ),
      ),
    );
  }
}
