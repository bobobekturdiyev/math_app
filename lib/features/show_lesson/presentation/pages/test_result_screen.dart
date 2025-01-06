import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math_app/core/resources/styles.dart';
import 'package:math_app/core/widgets/w_appbar.dart';
import 'package:math_app/core/widgets/w_circle_index_card.dart';
import 'package:math_app/features/show_lesson/data/model/quiz_models/either_result_dto.dart';
import 'package:math_app/features/show_lesson/presentation/widgets/w_test_variants.dart';

@RoutePage()
class TestResultScreen extends StatelessWidget {
  final EitherResultDto eitherResultDto;

  const TestResultScreen({super.key, required this.eitherResultDto});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: WAppBar(
          title: "test_results".tr(),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              ...List.generate(
                10,
                (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        WCircleIndexCard(index: index),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          eitherResultDto.result![index].questionText,
                          style:
                              Styles.getTextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
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
                        imageUrl: eitherResultDto.result![index].photo,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    WTestVariants.disabled(
                      items: eitherResultDto.result![index].options
                          .map((e) => e.text)
                          .toList(),
                      initialIndex:
                          eitherResultDto.result![index].options.indexWhere(
                        (e) =>
                            e.id ==
                            int.parse(
                                eitherResultDto.result![index].userAnswerId),
                      ),
                      correctIndex:
                          eitherResultDto.result![index].options.indexWhere(
                        (e) =>
                            e.id ==
                            (eitherResultDto.result![index].correctOptionId),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
