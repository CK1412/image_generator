import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/resources/animations.dart';
import '../../../constants/resources/colors.dart';
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

    return Container(
      constraints: const BoxConstraints(
        maxWidth: 400,
        maxHeight: 400,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: isGeneratingImage
              ? Center(
                  child: Lottie.asset(AppAnimations.lottieLoading),
                )
              : imageUrl == null
                  ? Center(
                      child: SvgPicture.asset(AppIcons.svgPicture),
                    )
                  : CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.contain,
                      placeholder: (context, url) {
                        return Container(
                          color: AppColors.bgDashboard,
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
    );
  }
}
