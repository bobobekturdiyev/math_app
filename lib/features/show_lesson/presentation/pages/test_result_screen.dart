import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math_app/core/resources/app_images.dart';
import 'package:math_app/core/resources/styles.dart';
import 'package:math_app/core/widgets/w_appbar.dart';
import 'package:math_app/core/widgets/w_circle_index_card.dart';
import 'package:math_app/features/show_lesson/presentation/widgets/w_test_variants.dart';

@RoutePage()
class TestResultScreen extends StatelessWidget {
  const TestResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rnd=Random();


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
                          "Ushbu rasmdagi masalani yeching!",
                          style: Styles.getTextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Image.asset(AppImages.matter,height: 200,),
                    const SizedBox(height: 20,),
                    WTestVariants.disabled(
                      items: [],
                      onChange: (v) {},
                      initialIndex: rnd.nextInt(4),
                      correctIndex: rnd.nextInt(4),
                    ),
                    const SizedBox(height: 24,)
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
