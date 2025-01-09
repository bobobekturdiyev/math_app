import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';

class WCoverImage extends StatelessWidget {
  final String image;
  final BorderRadiusGeometry borderRadius;

  const WCoverImage({
    super.key,
    required this.image,
    this.borderRadius = const BorderRadius.only(
      topRight: Radius.circular(16),
      topLeft: Radius.circular(16),
    ),
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.fitWidth,
          width: double.infinity,
          errorWidget: (ctx, str, obj) => Container(
              decoration: const BoxDecoration(
                color: AppColors.shimmerAnimateLight,
              ),
              child: const Center(
                child: Icon(
                  Icons.image,
                  color: AppColors.grey,
                ),
              )),
        ),
      ),
    );
  }
}
