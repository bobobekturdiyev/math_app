import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/resources/styles.dart';
import 'package:math_app/core/widgets/w_circle_index_card.dart';
import 'package:math_app/core/shared_entities/module_entity.dart';

import '../../../../core/resources/app_colors.dart';

class WExpansionTile extends StatefulWidget {
  final ModuleEntity moduleEntity;
  final Function(int index) onLessonTap;

  const WExpansionTile({super.key, required this.moduleEntity, required this.onLessonTap});

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
          widget.moduleEntity.name,
          style: Styles.getTextStyle(color: AppColors.subTextColor),
        ),
        children: [
          ...List.generate(
            widget.moduleEntity.lessons.length,
            (index) => GestureDetector(
              onTap: (){
                widget.onLessonTap(index);
              },
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
                        WCircleIndexCard(index: index),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.moduleEntity.lessons[index].title,
                              style: Styles.getLessonTitle(),
                            ),
                            Text(
                              "Video - ${widget.moduleEntity.lessons[index].duration} min",
                              style: Styles.getLessonSubTitle(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      widget.moduleEntity.lessons[index].hasAccess == 1
                          ? AppIcons.playRoundDis
                          : AppIcons.lock,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFFCED4D3),
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
