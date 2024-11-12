import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/app_colors.dart';
import '../resources/app_icons.dart';
import '../resources/styles.dart';

class WRemovableChip extends StatelessWidget {
  final String title;
  final GestureTapCallback onCloseTap;

  const WRemovableChip({
    Key? key,
    required this.title,
    required this.onCloseTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primaryColor, width: 1)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style:
                Styles.getTextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            width: 14,
          ),
          GestureDetector(
            onTap: onCloseTap,
            child: SvgPicture.asset(
              AppIcons.X,
              width: 16,
              height: 16,
              colorFilter: const ColorFilter.mode(
                  AppColors.primaryColor, BlendMode.srcIn),
            ),
          )
        ],
      ),
    );
  }
}
