import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/app_icons.dart';

class WSettingsItem extends StatelessWidget {
  final String text;
  final String icon;
  final GestureTapCallback onTap;
  final bool showArrow;

  const WSettingsItem({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    this.showArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 42,
              height: 42,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: locator<ThemeData>().textTheme.bodyMedium,
              ),
            ),
            if (showArrow) ...{
              SvgPicture.asset(
                AppIcons.arrowRightRounded,
                width: 36,
                height: 36,
                colorFilter: ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
              ),
            },
          ],
        ),
      ),
    );
  }
}
