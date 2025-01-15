import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:math_app/config/routes/router.gr.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/resources/app_lottie.dart';
import 'package:math_app/core/widgets/w_button.dart';
import 'package:math_app/core/widgets/w_loader.dart';
import 'package:math_app/features/home/data/model/quiz/quiz_dto.dart';
import 'package:math_app/features/quiz/presentation/manager/questions/questions_bloc.dart';

@RoutePage()
class QuizScreen extends StatefulWidget {
  final QuizDto quizDto;

  const QuizScreen({
    super.key,
    required this.quizDto,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  QuestionsBloc questionsBloc = QuestionsBloc();

  @override
  void initState() {
    super.initState();
    _loadQuestion();
  }

  _loadQuestion() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).unfocus();
    });
    if (widget.quizDto.id != null) {
      questionsBloc.add(LoadQuestions(quizId: widget.quizDto.id!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: questionsBloc,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    context.router.maybePop();
                  },
                  child: SvgPicture.asset(AppIcons.arrowLeftBadge),
                ),
                SizedBox(width: 12),
                Text(
                  "${widget.quizDto.title}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Lottie.asset(AppLottie.hand),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Text(
                        "Savollar: ${widget.quizDto.questionsCount} ta",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Test davomiyligi: ${widget.quizDto.durationText}",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      BlocBuilder<QuestionsBloc, QuestionsState>(
                        builder: (context, state) {
                          if (state is QuestionsLoaded) {
                            return WButton(
                              text: "Testni boshlash",
                              onTap: () {
                                context.router.replace(
                                  TestsRoute(
                                    questions: state.questions,
                                    title: widget.quizDto.title ?? "?title",
                                    duration: widget.quizDto.duration ?? 0,
                                  ),
                                );
                              },
                            );
                          } else if (state is QuestionsLoading) {
                            return WLoader();
                          } else if (state is QuestionsError) {
                            return Column(
                              children: [
                                Text(state.message),
                                WButton(
                                  text: "Qayta yuklash",
                                  onTap: () {
                                    _loadQuestion();
                                  },
                                ),
                              ],
                            );
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 36.0),
              child: Text(
                "Knopkani bosishingiz bilan\ntest shu zahoti boshlanadi",
                style: TextStyle(color: AppColors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
