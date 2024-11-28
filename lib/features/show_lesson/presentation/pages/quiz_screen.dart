import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math_app/config/routes/router.gr.dart';
import 'package:math_app/core/extensions/integer_extensions.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/resources/state_status.dart';
import 'package:math_app/core/widgets/w_appbar.dart';
import 'package:math_app/core/widgets/w_circle_index_card.dart';
import 'package:math_app/core/widgets/w_text_link.dart';
import 'package:math_app/features/show_lesson/presentaion/manager/quiz_manager/quiz_bloc.dart';
import 'package:math_app/features/show_lesson/presentaion/manager/test_provider.dart';
import 'package:math_app/features/show_lesson/presentaion/pages/either_result_screen.dart';
import 'package:math_app/features/show_lesson/presentaion/widgets/w_test_variants.dart';
import 'package:provider/provider.dart';
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
      child: ChangeNotifierProvider(
        create: (ctx) => TestProvider(),
        child: Consumer<TestProvider>(
          builder: (context, testProvider, child) {
            return PopScope(
              canPop: false,
              onPopInvokedWithResult: (didPop, dynamic) {
                if (didPop) {
                  return;
                }
                _showBackDialog(context);
              },
              child: Scaffold(
                appBar: WAppBar(
                  title: "test".tr(),
                ),
                backgroundColor: AppColors.backgroundColor,
                body: BlocBuilder<QuizBloc, QuizState>(
                  builder: (context, state) {
                    if(state.stateStatus==StateStatus.loading){
                      return const Center(child: CircularProgressIndicator(),);
                    }else if(state.stateStatus==StateStatus.loaded){
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            SingleChildScrollView(
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ...List.generate(
                                    state.quizDto?.questions.length??0,
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
                                            decoration: BoxDecoration(
                                              color: index == 0
                                                  ? AppColors.primaryColor
                                                  : (index == 1
                                                  ? AppColors
                                                  .primaryColorAccent
                                                  : Colors.white),
                                              borderRadius:
                                              BorderRadius.circular(12),
                                              border: Border.all(
                                                color: (index == 1 || index == 0)
                                                    ? AppColors.primaryColor
                                                    : index == 2
                                                    ? AppColors.yellow
                                                    : AppColors.borderColor,
                                              ),
                                            ),
                                            child: Text(
                                              (index + 1).indexFormat(),
                                              style: Styles.getLessonIndexStyle()
                                                  .copyWith(
                                                  color: index == 1
                                                      ? AppColors.primaryColor
                                                      : index == 0
                                                      ? AppColors.white
                                                      : AppColors
                                                      .subTextColor),
                                            ),
                                          ),
                                          if (index == 0 || index == 2)
                                            Positioned(
                                              bottom: 0,
                                              right: 0,
                                              left: 0,
                                              child: index != 0
                                                  ? SvgPicture.asset(
                                                AppIcons
                                                    .exclamationRoundBadge,
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
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * .64,
                              child: PageView.builder(
                                controller: controller,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.quizDto?.questions.length??0,
                                itemBuilder: (ctx, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24),
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
                                                  state.quizDto?.title??'',
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
                                            height: 200, imageUrl: state.quizDto!.questions[index].photo,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        WTestVariants(
                                          items:
                                          state.quizDto!.questions[index].options.map((e)=>e.text).toList(),
                                          onChange: (selectedIndex) {
                                            // testProvider.selectAnswer(
                                            //     index,
                                            //     testProvider.tests[index]
                                            //         .variants[selectedIndex]);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );

                    }else if(state.stateStatus==StateStatus.error){
                      return Center(child: Text(state.error??"Error"),);
                    }else{
                      return const SizedBox();
                    }
                  },
                ),
                floatingActionButton: Padding(
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
                            if (testProvider.currentIndex > 0) {
                              testProvider
                                  .changeIndex(testProvider.currentIndex - 1);
                              controller
                                  .jumpToPage(testProvider.currentIndex - 1);
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
                                style: Styles.getButtonStyle().copyWith(
                                    color: AppColors.backBtnTextColor),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: WButton(
                          borderRadius: 16,
                          text: testProvider.isTestComplete
                              ? "finish".tr()
                              : "next".tr(),
                          onTap: () {
                            if (testProvider.isTestComplete) {
                              context.router.push(EitherResultRoute(
                                  resultType: ResultType.success));
                            } else {
                              if (testProvider.currentIndex <
                                  testProvider.tests.length - 1) {
                                testProvider
                                    .changeIndex(testProvider.currentIndex + 1);
                                controller
                                    .jumpToPage(testProvider.currentIndex);
                              } else {
                                testProvider
                                    .changeIndex(testProvider.currentIndex);
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
