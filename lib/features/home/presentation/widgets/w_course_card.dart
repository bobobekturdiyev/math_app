import 'package:flutter/material.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/styles.dart';
import 'package:math_app/core/util/helpers.dart';
import 'package:math_app/features/home/data/model/course/course_dto.dart';
import 'package:math_app/features/home/presentation/widgets/w_cover_image.dart';

class WCourseCard extends StatelessWidget {
  final CourseDto course;

  const WCourseCard({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(.04),
            spreadRadius: 0,
            blurRadius: 42,
            offset: const Offset(0, 24),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (course.image != null) ...{
            WCoverImage(
              image: course.image!,
            ),
          },
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Text(
                  course.title ?? "?",
                  style: Styles.getCourseTitleStyle(),
                ),
                Text(
                  course.excerpt ?? "?",
                  style: Styles.getTextStyle(fontSize: 12),
                ),
                const SizedBox(
                  height: 8,
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (course.totalLessons != null) ...{
                              const Icon(
                                Icons.list_alt_rounded,
                                color: AppColors.grey,
                                size: 20,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "${course.totalLessons!.toString()} ta mavzu",
                                style: const TextStyle(fontSize: 12),
                              ),
                              const SizedBox(width: 12),
                            },
                            if (course.totalVideos != null) ...{
                              const Icon(
                                Icons.video_file_outlined,
                                color: AppColors.grey,
                                size: 20,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "${course.totalVideos!.toString()} ta video",
                                style: const TextStyle(fontSize: 12),
                              ),
                              const SizedBox(width: 12),
                            },
                            if (course.duration != null) ...{
                              const Icon(
                                Icons.video_collection_outlined,
                                color: AppColors.grey,
                                size: 20,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                course.duration!,
                                style: const TextStyle(fontSize: 12),
                              ),
                              const SizedBox(width: 12),
                            },
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                if (course.price != null && course.price! > 0) ...{
                  Text(
                    Helper.priceFormat(course.price!),
                    style: Styles.getActivePriceStyle(),
                  ),
                },

                // const WCourseRating(),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
