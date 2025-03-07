import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/app_images.dart';

class WLogo extends StatelessWidget {
  final double size;
  final Color color;
  final bool isDark;

  const WLogo({
    super.key,
    this.size = 60,
    this.isDark = false,
    this.color = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.logo,
      width: size,
      height: size,
    );
  }
}
