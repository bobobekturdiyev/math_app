import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:math_app/features/my_courses/data/model/my_course_dto/my_course_dto.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/styles.dart';

class WMyCourseItem extends StatelessWidget {
  final MyCourseDto myCourse;
final GestureTapCallback onTap;
  const WMyCourseItem({super.key, required this.myCourse, required this.onTap});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 15,
              offset: const Offset(0, 5),
              color: Colors.black.withOpacity(0.05),
            ),
          ]),
      child: InkWell(
        onTap: onTap,
        child: Row(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: myCourse.photo,
                width: 86,
                height: 86,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    myCourse.name,
                    style: Styles.getTextStyle(
                        fontWeight: FontWeight.w600, fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    myCourse.author,
                    style: Styles.getTextStyle(
                      fontSize: 10,
                      color: AppColors.subTextColor,
                    ),
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  myCourse.duration,
                                  // "2 soat 53 minut",
                                  style: Styles.getTextStyle(
                                      fontSize: 8, color: AppColors.subTextColor),
                                ),
                                Text(
                                  "${myCourse.completedPercentage}%",
                                  style: Styles.getTextStyle(
                                      fontWeight: FontWeight.w600, fontSize: 10),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                             LinearProgressIndicator(
                              value: myCourse.completedPercentage/100,
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.primaryColor, //<-- SEE HERE
                              backgroundColor:
                                  AppColors.borderColor, //<-- SEE HERE
                            ),
                          ],
                        ),
                      ),


                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "${myCourse.completedLessons} / ${myCourse.totalLessons}",
                    style: Styles.getTextStyle(
                        fontSize: 8, color: AppColors.subTextColor),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
