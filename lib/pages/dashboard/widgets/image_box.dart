
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

    final imageUrl = dashboardState.currentImageUrl;

    return Container(
      constraints: const BoxConstraints(
        maxWidth: 400,
        maxHeight: 400,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: imageUrl != null ? AppColors.lightGrey : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: imageUrl == null
            ? Center(
                child: SvgPicture.asset(AppIcons.svgPicture),
              )
            : CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.contain,
                progressIndicatorBuilder: (context, url, progress) {
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
    );
  }
}
