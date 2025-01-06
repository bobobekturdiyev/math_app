import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math_app/core/extensions/integer_extensions.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/resources/styles.dart';
import 'package:math_app/features/show_lesson/presentation/manager/quiz_manager/quiz_bloc.dart';

class WQuizIndexes extends StatelessWidget {
   WQuizIndexes({super.key});
ScrollController controller=ScrollController();
  @override
  Widget build(BuildContext context) {
    final screenWith=MediaQuery.sizeOf(context).width;
    final quizBloc = context.watch<QuizBloc>();
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        double offset = (quizBloc.currentIndex * 44) - ( screenWith/ 2) + (44 / 2);
        controller.animateTo(
          offset,
          duration: const Duration(seconds: 1),
          curve: Curves.ease,
        );
        return SingleChildScrollView(
          controller: controller,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                state.quizDto?.questions.length ?? 0,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          bottom: 8,
                        ),
                        height: 44,
                        padding: const EdgeInsets.all(10),
                        decoration: quizBloc.currentIndex == index &&
                                !(quizBloc.answers.containsKey(state.quizDto?.questions[index].id.toString()) &&
                                    quizBloc.answers[state
                                            .quizDto?.questions[index].id
                                            .toString()] !=
                                        null)
                            ? _buildCurrentDecor()
                            : !quizBloc.answers.containsKey(state
                                    .quizDto?.questions[index].id
                                    .toString())
                                ? _buildDefaultDecor()
                                : quizBloc.answers.containsKey(state
                                            .quizDto?.questions[index].id
                                            .toString()) &&
                                        quizBloc.answers[state.quizDto?.questions[index].id.toString()] != null
                                    ? _buildSelectedDecor()
                                    : _buildNotSelDecor(),
                        child: Text(
                          (index + 1).indexFormat(),
                          style: Styles.getLessonIndexStyle().copyWith(
                            color: quizBloc.currentIndex == index &&
                                    !(quizBloc.answers.containsKey(state
                                            .quizDto?.questions[index].id
                                            .toString()) &&
                                        quizBloc.answers[state
                                                .quizDto?.questions[index].id
                                                .toString()] !=
                                            null)
                                ? AppColors.primaryColor
                                : quizBloc.answers.containsKey(state
                                            .quizDto?.questions[index].id
                                            .toString()) &&
                                        quizBloc.answers[state.quizDto?.questions[index].id.toString()] != null
                                    ? AppColors.white
                                    : AppColors.subTextColor,
                          ),
                        ),
                      ),
                      if (quizBloc.answers.containsKey(
                          state.quizDto?.questions[index].id.toString()))
                        Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: SvgPicture.asset(
                            quizBloc.answers.containsKey(state
                                        .quizDto?.questions[index].id
                                        .toString()) &&
                                    quizBloc.answers[state
                                            .quizDto?.questions[index].id
                                            .toString()] !=
                                        null
                                ? AppIcons.checkRoundBadge
                                : AppIcons.exclamationRoundBadge,
                            width: 16,
                            height: 16,
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  BoxDecoration _buildDefaultDecor() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.borderColor,
        ),
      );

  BoxDecoration _buildCurrentDecor() => BoxDecoration(
        color: AppColors.primaryColorAccent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.borderColor,
        ),
      );

  BoxDecoration _buildSelectedDecor() => BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.primaryColor,
        ),
      );

  BoxDecoration _buildNotSelDecor() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.yellow,
        ),
      );
}
