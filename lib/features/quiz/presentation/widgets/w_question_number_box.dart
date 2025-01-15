import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:math_app/core/extensions/integer_extensions.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/resources/question_selection_state.dart';
import 'package:math_app/core/resources/styles.dart';

class WQuestionNumberBox extends StatelessWidget {
  final QuestionSelectionState questionSelectionState;
  final int index;

  const WQuestionNumberBox({
    super.key,
    this.questionSelectionState = QuestionSelectionState.unselected,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    Color color = Colors.white;
    Color borderColor = Colors.white;
    Color textColor = AppColors.subTextColor;

    switch (questionSelectionState) {
      case QuestionSelectionState.selected:
        {
          color = AppColors.primaryColor;
          borderColor = AppColors.primaryColor;
          textColor = AppColors.white;
          break;
        }
      case QuestionSelectionState.current:
        {
          color = AppColors.primaryColorAccent;
          borderColor = AppColors.primaryColor;
          textColor = AppColors.primaryColor;

          break;
        }
      case QuestionSelectionState.skipped:
        {
          color = AppColors.white;
          borderColor = AppColors.yellow;
          textColor = AppColors.subTextColor;

          break;
        }
      default:
        {
          color = AppColors.white;
          borderColor = AppColors.borderColor;
          textColor = AppColors.subTextColor;
        }
    }

    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(
              bottom: 8,
            ),
            height: 44,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: borderColor,
              ),
            ),
            child: Text(
              (index + 1).indexFormat(),
              style: Styles.getLessonIndexStyle().copyWith(color: textColor),
            ),
          ),
          if (questionSelectionState == QuestionSelectionState.selected ||
              questionSelectionState == QuestionSelectionState.skipped)
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: questionSelectionState == QuestionSelectionState.skipped
                  ? SvgPicture.asset(
                      AppIcons.exclamationRoundBadge,
                      width: 16,
                      height: 16,
                    )
                  : SvgPicture.asset(
                      AppIcons.checkRoundBadge,
                      width: 16,
                      height: 16,
                    ),
            )
        ],
      ),
    );
  }
}
