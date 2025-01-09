import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/resources/styles.dart';
import 'package:math_app/core/widgets/w_circle_index_card.dart';
import 'package:math_app/features/home/data/model/course/module_dto.dart';

import '../../../../core/resources/app_colors.dart';

class WExpansionTile extends StatefulWidget {
  final ModuleDto module;

  // final List<LessonDto> lesson;
  final bool isLogin;

  const WExpansionTile(
      {Key? key,
      required this.module,
      // required this.lesson,
      required this.isLogin})
      : super(key: key);

  @override
  State<WExpansionTile> createState() => _WExpansionTileState();
}

class _WExpansionTileState extends State<WExpansionTile> {
  bool isOpen = false;

  late ModuleDto module;

  @override
  void initState() {
    super.initState();
    module = widget.module;
  }

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
          module.name ?? "?modulename",
          style: Styles.getTextStyle(color: AppColors.subTextColor),
        ),
        children: List.generate(
          module.lessons?.length ?? 0,
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
                  Expanded(
                    child: Row(
                      children: [
                        WCircleIndexCard(index: index),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                module.lessons![index].title ?? "?lessonTitle",
                                style: Styles.getLessonTitle(),
                              ),
                              Text(
                                module.lessons![index].duration ?? "?duration",
                                style: Styles.getLessonSubTitle(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset(module.lessons![index].isOpen ?? false
                      ? AppIcons.playRoundDis
                      : AppIcons.lock),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
