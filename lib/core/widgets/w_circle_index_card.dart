import 'package:flutter/material.dart';
import 'package:math_app/core/extensions/integer_extensions.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/styles.dart';

class WCircleIndexCard extends StatelessWidget {
  final  int index;
  const WCircleIndexCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return         Container(
      alignment: Alignment.center,
      height: 32,
      width: 32,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color:
        AppColors.lessonIndexCircleC,
      ),
      child: Text(
        (index + 1).indexFormat(),
        style: Styles.getLessonIndexStyle(),
      ),
    );
  }
}
