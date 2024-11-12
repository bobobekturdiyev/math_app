import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/resources/styles.dart';

class WCourseRating extends StatelessWidget {
  const WCourseRating({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Row
        (
        children: [
          Text(
            "4.8",
            style: Styles.getTextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          ...List.generate(
            4,
                (index) => SvgPicture.asset(
              AppIcons.star,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            "(234)",
            style: Styles.getTextStyle(
                fontSize: 10, color: AppColors.subTextColor),
          )
        ],
      );
  }
}
