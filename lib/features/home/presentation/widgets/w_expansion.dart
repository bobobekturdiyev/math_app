import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:math_app/config/routes/route_path.dart';
import 'package:math_app/config/routes/router.gr.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/resources/styles.dart';

import '../../../../core/resources/app_colors.dart';
import '../../data/model/lesson/lesson_dto.dart';

class WExpansionTile extends StatefulWidget {
  final String title;

  // final List<LessonDto> lesson;
  final bool isLogin;

  const WExpansionTile(
      {Key? key,
      required this.title,
      // required this.lesson,
      required this.isLogin})
      : super(key: key);

  @override
  State<WExpansionTile> createState() => _WExpansionTileState();
}

class _WExpansionTileState extends State<WExpansionTile> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        onExpansionChanged: (value) {
          setState(() {
            isOpen = value;
          });
        },
        trailing: SvgPicture.asset(isOpen ? AppIcons.minus : AppIcons.plus),
        title: Text(
          'Bo’lim 1 - Kirish',
          style: Styles.getTextStyle(color: AppColors.subTextColor),
        ),
        children: [
          ...List.generate(
            2,
            (index) => GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 0,
                      blurRadius: 15,
                      offset: const Offset(0, 10),
                      color: Colors.black.withOpacity(0.05),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 32,
                          width: 32,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primaryColorAccent),
                          child: Text(
                            formatNumber(index + 1),
                            style: Styles.getLessonIndexStyle(),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "DTM 2022 1-DARS",
                              style: Styles.getLessonTitle(),
                            ),
                            Text(
                              "Video - 15:22 min",
                              style: Styles.getLessonSubTitle(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SvgPicture.asset('isOpen' == 'open'
                        ? AppIcons.playRoundDis
                        : AppIcons.lock),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String formatNumber(int number) {
    return number.toString().padLeft(2, '0');
  }
}
