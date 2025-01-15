import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/resources/styles.dart';
import 'package:math_app/features/quiz/presentation/manager/test/test_bloc.dart';
import 'package:math_app/features/quiz/presentation/widgets/w_test_variants.dart';

@RoutePage()
class TestResultScreen extends StatelessWidget {
  final QuizResultState quizResultState;

  const TestResultScreen({
    super.key,
    required this.quizResultState,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            elevation: 0,
            automaticallyImplyLeading: false,
            scrolledUnderElevation: 0,
            backgroundColor: AppColors.white,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    context.router.maybePop();
                  },
                  child: SvgPicture.asset(AppIcons.arrowLeftBadge),
                ),
                SizedBox(width: 12),
                Text(
                  "Test natijalari",
                  style: Styles.getTextStyle(fontSize: 16),
                )
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: quizResultState.questions.length,
              (_, index) {
                final question = quizResultState.questions[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
                      if (question.text != null) ...{
                        Text(
                          question.text!,
                          style: Styles.getTextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      },
                      if (question.image != null) ...{
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(32),
                              child: CachedNetworkImage(
                                imageUrl: question.image!,
                                fit: BoxFit.fitWidth,
                                width: double.infinity,
                                errorWidget: (ctx, str, obj) => Container(
                                  decoration: const BoxDecoration(
                                    color: AppColors.shimmerAnimateLight,
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.image,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      },
                      const SizedBox(
                        height: 20,
                      ),
                      Builder(builder: (context) {
                        int selectedOptionId = -1;
                        if (quizResultState.selectedOptions
                            .containsKey(question.id)) {
                          selectedOptionId =
                              quizResultState.selectedOptions[question.id] ??
                                  -1;
                        }

                        return WTestVariants(
                          options: question.options,
                          selectedOptionId: selectedOptionId,
                          disabled: true,
                        );
                      }),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
