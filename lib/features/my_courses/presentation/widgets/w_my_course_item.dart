import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:math_app/features/my_courses/data/model/my_course_dto/my_course_dto.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/styles.dart';

class WMyCourseItem extends StatelessWidget {
  // final MyCourseDto myCourse;
  const WMyCourseItem({
    Key? key,
  }) : super(key: key);

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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-C_UAhXq9GfuGO452EEzfbKnh1viQB9EDBQ&s",
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
                  "DTM 2022",
                  style: Styles.getTextStyle(
                      fontWeight: FontWeight.w600, fontSize: 12),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "Sardorxon Urfonxonov",
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
                                "2 soat 53 minut",
                                style: Styles.getTextStyle(
                                    fontSize: 8, color: AppColors.subTextColor),
                              ),
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
