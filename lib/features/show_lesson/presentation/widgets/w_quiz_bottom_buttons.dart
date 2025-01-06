import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/resources/styles.dart';
import 'package:math_app/core/widgets/w_button.dart';
import 'package:math_app/features/show_lesson/presentation/manager/quiz_manager/quiz_bloc.dart';

class WQuizBottomButtons extends StatelessWidget {
  final PageController controller;

  const WQuizBottomButtons({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final quizBloc = context.read<QuizBloc>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: WButton(
              borderRadius: 16,
              buttonType: ButtonType.outline,
              color: AppColors.borderColor,
              text: "",
              onTap: () {
                if (quizBloc.currentIndex > 0) {
                  quizBloc.add(SelectOptionEvent(
                      questionId: quizBloc
                          .state.quizDto!.questions[quizBloc.currentIndex].id
                          .toString()));
                  quizBloc.currentIndex--;
                  controller.jumpToPage(quizBloc.currentIndex);
                }
              },
              child: Row(
                children: [
                  SvgPicture.asset(AppIcons.arrowLeft),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "back".tr(),
                    style: Styles.getButtonStyle()
                        .copyWith(color: AppColors.backBtnTextColor),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: BlocBuilder<QuizBloc, QuizState>(
              builder: (context, state) {
                return WButton(
                  borderRadius: 16,
                  showLoader: state.checkQuizState == CheckQuizState.loading,
                  text: context
                              .watch<QuizBloc>()
                              .answers
                              .values
                              .every((e) => e != null) &&
                          !(context.watch<QuizBloc>().answers.length <
                              (state.quizDto?.questionCount ?? 0))
                      ? "finish".tr()
                      : "next".tr(),
                  onTap: ()async {
                    if (quizBloc.answers.values.every((e) => e != null) &&
                        !(quizBloc.answers.length <
                            (state.quizDto?.questionCount ?? 0))) {
                      quizBloc.add(QuizCheckEvent());

                    } else {
                      if (quizBloc.currentIndex <
                          state.quizDto!.questions.length - 1) {
                        quizBloc.add(
                          SelectOptionEvent(
                            questionId: state
                                .quizDto!.questions[quizBloc.currentIndex].id
                                .toString(),
                          ),
                        );
                        quizBloc.currentIndex++;
                        controller.jumpToPage(quizBloc.currentIndex);
                      } else {
                        quizBloc.add(SelectOptionEvent(
                            questionId: quizBloc.state.quizDto!
                                .questions[quizBloc.currentIndex].id
                                .toString()));
                        quizBloc.currentIndex =
                            findFirstNullIndex(quizBloc.answers)!;
                        controller.jumpToPage(quizBloc.currentIndex);
                      }
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  int? findFirstNullIndex(Map<String, String?> map) {
    var entries = map.entries.toList();
    for (int i = 0; i < entries.length; i++) {
      if (entries[i].value == null) {
        return i;
      }
    }
    return null;
  }
}
