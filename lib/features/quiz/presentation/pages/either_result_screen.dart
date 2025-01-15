import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:math_app/config/routes/router.gr.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/resources/styles.dart';
import 'package:math_app/core/widgets/w_button.dart';
import 'package:math_app/core/widgets/w_text_link.dart';
import 'package:math_app/features/quiz/presentation/manager/test/test_bloc.dart';

enum ResultType { success, failure }

@RoutePage()
class EitherResultScreen extends StatelessWidget {
  final ResultType resultType;
  final QuizResultState quizResultState;

  const EitherResultScreen({
    super.key,
    required this.resultType,
    required this.quizResultState,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_F7F7F7,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: resultType == ResultType.failure
                    ? AppColors.danger
                    : AppColors.primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Text(
                      "To'g'ri javob: ${quizResultState.quizResultDto.correctAnswers}/${quizResultState.quizResultDto.totalQuestions}",
                      style: Styles.getCorrectAnswersStyle(),
                    ),
                  ),
                  Container(
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
                                ? "Testdan o’tishingizga yetarlicha ball to’play olmadingiz"
                                : "Tabriklaymiz! Siz testni muvaffaqiyatli yakunladingiz.",
                            style: Styles.getResultTextStyle(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          resultType == ResultType.failure
                              ? "Darslarni qayta ko’rib, testdan o’tishingiz kerak."
                              : "Kursda davom etish uchun quyidagi knopkani bosing",
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
                                  ? "Darslarga qaytish"
                                  : "Davom etish",
                              onTap: () {
                                context.router.maybePop();
                              },
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            if (resultType == ResultType.success)
              WTextLink(
                text: "Test natijalarini tekshirish",
                onTap: () {
                  context.router
                      .push(TestResultRoute(quizResultState: quizResultState));
                },
              ),
          ],
        ),
      ),
    );
  }
}
