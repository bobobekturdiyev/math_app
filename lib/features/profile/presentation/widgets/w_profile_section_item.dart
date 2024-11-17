import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/resources/styles.dart';

class WProfileSectionItem extends StatelessWidget {
  final String leadingIconPath;
  final String title;
  final Widget? trailing;
  final GestureTapCallback onTap;

  const WProfileSectionItem(
      {super.key,
      required this.leadingIconPath,
      required this.title,
      this.trailing,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 42,
                    width: 42,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColorAccent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: SvgPicture.asset(
                      leadingIconPath,
                      colorFilter: const ColorFilter.mode(
                          AppColors.primaryColor, BlendMode.srcIn),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Flexible(
                    child: Text(
                      title,
                      style: Styles.getTextStyle(),
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              ),
            ),
            trailing != null
                ? trailing!
                : SvgPicture.asset(AppIcons.rightArrow),
          ],
        ),
      ),
    );
  }
}
