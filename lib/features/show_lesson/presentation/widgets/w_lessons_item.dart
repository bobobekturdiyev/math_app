import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/resources/styles.dart';
import 'package:math_app/core/shared/domain/shared_entities/lesson_entity.dart';
import 'package:math_app/core/widgets/w_circle_index_card.dart';

class WLessonsItem extends StatelessWidget {
  final LessonEntity lessonEntity;
  final GestureTapCallback onTap;
  final int index;
  final bool isPLaying;
  const WLessonsItem({super.key, required this.lessonEntity, required this.onTap, required this.index, required this.isPLaying});

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: onTap,
        child: Container(
          margin:
          const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: isPLaying
                ? AppColors
                .currentCourseCardColor
                : AppColors.white,
            borderRadius:
            BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                spreadRadius: 0,
                blurRadius: 15,
                offset: const Offset(0, 10),
                color: Colors.black
                    .withOpacity(0.05),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    WCircleIndexCard(
                        index: index,),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment
                            .start,
                        children: [
                          Text(
                       lessonEntity
                                .title,
                            style: Styles
                                .getLessonTitle(),
                          ),
                          Text(
                       lessonEntity
                                .duration,
                            maxLines: 1,
                            overflow:
                            TextOverflow
                                .ellipsis,
                            // "Video - 15:22 min",
                            style: Styles
                                .getLessonSubTitle(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SvgPicture.asset(
                isPLaying?
                 AppIcons.pause:

                lessonEntity.isWatched
                  ? AppIcons.checkCircle
                  : AppIcons.lock,
              ),
            ],
          ),
        ),
      );
  }
}
