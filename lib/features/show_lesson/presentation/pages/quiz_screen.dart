import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/config/routes/router.gr.dart';
import 'package:math_app/core/resources/state_status.dart';
import 'package:math_app/core/widgets/w_appbar.dart';
import 'package:math_app/core/widgets/w_circle_index_card.dart';
import 'package:math_app/core/widgets/w_text_link.dart';
import 'package:math_app/features/show_lesson/presentation/manager/quiz_manager/quiz_bloc.dart';
import 'package:math_app/features/show_lesson/presentation/widgets/w_quiz_bottom_buttons.dart';
import 'package:math_app/features/show_lesson/presentation/widgets/w_quiz_indexes.dart';
import 'package:math_app/features/show_lesson/presentation/widgets/w_test_variants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:math_app/core/resources/styles.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/widgets/w_button.dart';

@RoutePage()
class QuizScreen extends StatefulWidget {
  final int quizId;

  const QuizScreen({super.key, required this.quizId});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  PageController controller = PageController();
  late QuizBloc quizBloc;

  Future<bool?> _showBackDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          child: Container(
            width: 350,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "test_is_not_complete".tr(),
                  style: Styles.getDialogTitle(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "close_the_test_completely_text".tr(),
                  style: Styles.getDialogText(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 44,
                    ),
                    Expanded(
                      child: WTextLink(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 0),
                        text: "back".tr().toUpperCase(),
                        color: AppColors.C_A1A1A1,
                        onTap: () {
                          Navigator.pop(context, false);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    WButton(
                      verticalPadding: 12,
                      horizontalPadding: 24,
                      textStyle: Styles.getButtonStyle(),
                      onTap: () {
                        Navigator.pop(context, true);
                        Navigator.pop(context, true);
                      },
                      text: 'continue'.tr(),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    quizBloc = QuizBloc(context.read());

    quizBloc.add(GetQuizById(quizId: widget.quizId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => quizBloc,
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, dynamic) {
          if (didPop) {
            return;
          }
          _showBackDialog(context);
        },
        child: BlocListener<QuizBloc, QuizState>(
          listener: (context, state) {
            if (state.checkQuizState == CheckQuizState.loaded) {
              context.router
                  .push(EitherResultRoute(resultDto: state.resultDto!));
            }
          },
          child: Scaffold(
            appBar: WAppBar(
              title: "test".tr(),
            ),
            backgroundColor: AppColors.backgroundColor,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  WQuizIndexes(),
                  const SizedBox(
                    height: 24,
                  ),
                  BlocBuilder<QuizBloc, QuizState>(
                    builder: (context, state) {
                      if (state.stateStatus == StateStatus.loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state.stateStatus == StateStatus.loaded) {
                        return SizedBox(
                          height: MediaQuery.sizeOf(context).height * .64,
                          child: PageView.builder(
                            controller: controller,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.quizDto?.questions.length ?? 0,
                            itemBuilder: (ctx, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          WCircleIndexCard(index: index),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          Expanded(
                                            child: Text(
                                              state.quizDto?.title ?? '',
                                              style: Styles.getTextStyle(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.fitWidth,
                                        width: double.infinity,
                                        height: 200,
                                        imageUrl: state
                                            .quizDto!.questions[index].photo,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    WTestVariants(
                                      initialIndex: state
                                          .quizDto!.questions[index].options
                                          .indexWhere((e) => quizBloc.answers
                                              .containsValue(e.id.toString())),
                                      items: state
                                          .quizDto!.questions[index].options
                                          .map((e) => e.text)
                                          .toList(),
                                      onChange: (selectedIndex) {
                                        quizBloc.add(
                                          SelectOptionEvent(
                                            questionId: state
                                                .quizDto!.questions[index].id
                                                .toString(),
                                            optionId: state
                                                .quizDto!
                                                .questions[index]
                                                .options[selectedIndex]
                                                .id
                                                .toString(),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      } else if (state.stateStatus == StateStatus.error) {
                        return Center(
                          child: Text(state.error ?? "Error"),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ],
              ),
            ),
            floatingActionButton: WQuizBottomButtons(
              controller: controller,
            ),
          ),
        ),
      ),
    );
  }
}
