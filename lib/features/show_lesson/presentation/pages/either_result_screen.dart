import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:math_app/config/routes/router.gr.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/resources/styles.dart';
import 'package:math_app/core/widgets/w_button.dart';
import 'package:math_app/core/widgets/w_text_link.dart';
import 'package:math_app/features/show_lesson/data/model/quiz_models/either_result_dto.dart';

@RoutePage()
class EitherResultScreen extends StatelessWidget {
  final EitherResultDto resultDto;

  const EitherResultScreen({super.key, required this.resultDto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_F7F7F7,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 140,
            ),
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 44),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: !resultDto.passed
                        ? AppColors.danger
                        : AppColors.primaryColor,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: AppColors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 54,
                        ),
                        Center(
                          child: SvgPicture.asset(
                            !resultDto.passed
                                ? AppIcons.bubbleFailure
                                : AppIcons.bubbleSuccess,
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Center(
                          child: Text(
                            !resultDto.passed
                                ? "test_failure_message".tr()
                                : "test_success_message".tr(),
                            style: Styles.getResultTextStyle(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          !resultDto.passed
                              ? "failure_result_guide_info".tr()
                              : "success_result_guide_info".tr(),
                          style: Styles.getResultInfoGuide(),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: WButton(
                              text: !resultDto.passed
                                  ? "review_lessons".tr()
                                  : "go_to_next_section".tr(),
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                            ))
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 20,
                  child: Text(
                    "correct_answers".tr(namedArgs: {
                      'to': '${resultDto.correctAnswers}',
                      'from': '${resultDto.totalQuestions}'
                    }),
                    style: Styles.getCorrectAnswersStyle(),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            if (resultDto.passed)
              WTextLink(
                text: "check_test_results".tr(),
                onTap: () {
                  context.router.push(
                    TestResultRoute(
                      eitherResultDto: resultDto,
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
