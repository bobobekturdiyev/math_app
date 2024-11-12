import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_icons.dart';

class DropDownTrailing extends Icon {
  const DropDownTrailing({Key? key}) : super(Icons.arrow_drop_down, key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppIcons.profile,
      width: 16,
      height: 16,
      colorFilter: const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
    );
  }
}
