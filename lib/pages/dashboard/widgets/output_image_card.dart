import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../constants/resources/animations.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/constants.dart';
import '../../../constants/resources/colors.dart';

class OutputImageCard extends StatefulWidget {
  const OutputImageCard({super.key});

  @override
  State<OutputImageCard> createState() => _OutputImageCardState();
}

class _OutputImageCardState extends State<OutputImageCard> {
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
        ],
      ),
    );
  }
}

class ImageBox extends StatelessWidget {
  const ImageBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 400,
        maxHeight: 400,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: AppColors.lightGrey,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: CachedNetworkImage(
          imageUrl: Constants.image1,
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
