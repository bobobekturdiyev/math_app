import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:math_app/features/home/data/model/course/course_dto.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/styles.dart';

class WMyCourseItem extends StatelessWidget {
  final CourseDto course;

  const WMyCourseItem({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
            color: Colors.black.withValues(alpha: 0.05),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (course.image != null) ...{
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: course.image!,
                width: 96,
                height: 54,
                fit: BoxFit.cover,
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
            const SizedBox(
              width: 12,
            ),
          },
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (course.title != null) ...{
                  Text(
                    course.title!,
                    style: Styles.getTextStyle(
                        fontWeight: FontWeight.w600, fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                },
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
                              if (course.duration != null) ...{
                                Text(
                                  course.duration!,
                                  style: Styles.getTextStyle(
                                      fontSize: 8,
                                      color: AppColors.subTextColor),
                                ),
                              },
                              Text(
                                "75%",
                                style: Styles.getTextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 10),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          LinearProgressIndicator(
                            value: 0.75,
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
                  "38 / 50",
                  style: Styles.getTextStyle(
                      fontSize: 8, color: AppColors.subTextColor),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
