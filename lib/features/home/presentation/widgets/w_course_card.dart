import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/styles.dart';
import 'package:math_app/features/home/domain/entity/all_course_entity.dart';
import 'package:math_app/features/home/presentation/widgets/w_course_rating.dart';

class WCourseCard extends StatelessWidget {
  final AllCourseEntity allCourseEntity;
  final GestureTapCallback onTap;
  const WCourseCard({super.key, required this.allCourseEntity, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
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
      child: InkWell(
        onTap: onTap,

borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 152,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16),
                ),
                child: CachedNetworkImage(
                  imageUrl:allCourseEntity.photo,
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    allCourseEntity.name,
                    style: Styles.getCourseTitleStyle(),
                  ),
                  Text(
                    allCourseEntity.excerpt,
                    style: Styles.getTextStyle(fontSize: 10),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        "${allCourseEntity.discountPrice} so’m",
                        style: Styles.getActivePriceStyle(),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        "${allCourseEntity.price} so’m",
                        style: Styles.getDeActivePriceStyle(),
                      ),
                    ],
                  ),

                  WCourseRating()
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
