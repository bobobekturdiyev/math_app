import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:math_app/config/routes/route_data.dart';
import 'package:math_app/config/routes/router.gr.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/resources/styles.dart';
import 'package:math_app/core/widgets/w_button.dart';
import 'package:math_app/core/widgets/w_text_link.dart';

enum ResultType { success, failure }

@RoutePage()
class EitherResultScreen extends StatelessWidget {
  final ResultType resultType;

  const EitherResultScreen({super.key, required this.resultType});

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
                    color: resultType == ResultType.failure
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
                            resultType == ResultType.failure
                                ? AppIcons.bubbleFailure
                                : AppIcons.bubbleSuccess,
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Center(
                          child: Text(
                            resultType == ResultType.failure
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
                          resultType == ResultType.failure
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
                              text: resultType == ResultType.failure
                                  ? "review_lessons".tr()
                                  : "go_to_next_section".tr(),
                              onTap: () {},
                            ))
                      ],
                    ),
                  ),
                ),
                  Positioned(
                    top: 8,
                    left: 20,
                    child: Text(
                      "correct_answers"
                          .tr(namedArgs: {'to': '8', 'from': '10'}),
                      style: Styles.getCorrectAnswersStyle(),
                    ),
                  ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            if (resultType == ResultType.success)

            WTextLink(
              text: "check_test_results".tr(),
              onTap: () {context.router.push(const TestResultRoute());},
            ),
          ],
        ),
      ),
    );
  }
}
