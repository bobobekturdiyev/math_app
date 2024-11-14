import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math_app/config/routes/router.gr.dart';
import 'package:math_app/core/extensions/integer_extensions.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/resources/app_images.dart';
import 'package:math_app/core/widgets/w_appbar.dart';
import 'package:math_app/core/widgets/w_circle_index_card.dart';
import 'package:math_app/core/widgets/w_text_link.dart';
import 'package:math_app/features/show_lesson/presentaion/manager/test_provider.dart';
import 'package:math_app/features/show_lesson/presentaion/pages/either_result_screen.dart';
import 'package:math_app/features/show_lesson/presentaion/widgets/w_test_variants.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:math_app/core/resources/styles.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/widgets/w_button.dart';

@RoutePage()
class TestsScreen extends StatelessWidget {
  TestsScreen({super.key});

  PageController controller = PageController();

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
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => TestProvider(),
      child: Consumer<TestProvider>(
        builder: (context, testProvider, child) {
          return SafeArea(
            child: PopScope(
              canPop: false,
              onPopInvokedWithResult: (didPop,dynamic){
                if(didPop){
                  return ;
                    }
                _showBackDialog(context);
              },
              child: Scaffold(
                appBar: WAppBar(
                  title: "test".tr(),
                ),
                backgroundColor: AppColors.backgroundColor,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(
                              testProvider.tests.length,
                              (index) =>  Padding(
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
                                            ? AppColors.primaryColorAccent
                                            : Colors.white),
                                        borderRadius: BorderRadius.circular(12),
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
                                        style: Styles.getLessonIndexStyle().copyWith(
                                            color: index == 1
                                                ? AppColors.primaryColor
                                                : index == 0
                                                ? AppColors.white
                                                : AppColors.subTextColor),
                                      ),
                                    ),
                                    if (index == 0 || index == 2)
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        left: 0,
                                        child: index != 0
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
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .6,
                        child: PageView.builder(
                          controller: controller,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: testProvider.tests.length,
                          itemBuilder: (ctx, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      WCircleIndexCard(index: index),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                        'Test variantiga javob tanlang!',
                                        style: Styles.getTextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.asset(
                                      AppImages.matter,
                                      height: 200,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  WTestVariants(
                                    items: testProvider.tests[index].variants,
                                    onChange: (selectedIndex) {
                                      testProvider.selectAnswer(
                                          index,
                                          testProvider.tests[index]
                                              .variants[selectedIndex]);
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
                              testProvider.changeIndex(testProvider.currentIndex - 1);
                              controller.jumpToPage(testProvider.currentIndex - 1);
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
                        child: WButton(
                          borderRadius: 16,
                          text: testProvider.isTestComplete
                              ? "finish".tr()
                              : "next".tr(),
                          onTap: () {
                            if (testProvider.isTestComplete) {
                              context.router.push(EitherResultRoute(resultType: ResultType.success));
                            } else {
                              if (testProvider.currentIndex < testProvider.tests.length - 1) {
                                testProvider.changeIndex(testProvider.currentIndex + 1); 
                                controller.jumpToPage(testProvider.currentIndex); 
                              } else {
                                testProvider.changeIndex(testProvider.currentIndex);
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
