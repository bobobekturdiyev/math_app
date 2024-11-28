// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:math_app/features/home/data/model/all_course/all_course_dto.dart';
//
// import '../../../../core/resources/app_colors.dart';
// import '../../../../core/resources/styles.dart';
// class WCourseItem extends StatelessWidget {
//   final GestureTapCallback onTap;
//   final AllCourseDto courseDto;
//
//   const WCourseItem({Key? key, required this.onTap, required this.courseDto}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return    GestureDetector(
//       onTap:onTap ,
//       child: Container(
//         margin: const EdgeInsets.only(bottom: 20),
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16),
//             color: AppColors.white
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//
//             ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: CachedNetworkImage(
//                 imageUrl: courseDto.imageUrl,
//                 height: 140,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(height: 16,),
//             // WCourseCard(level: courseDto.level, time: courseDto.duration, sold: courseDto.enrollments.toString(),),
//             const SizedBox(height: 16,),
//             Text(
//               courseDto.title,
//               style: Styles.getTextStyle(fontSize: 18,fontWeight: FontWeight.w500),
//
//             ),
//             const SizedBox(height: 16,),
//             SizedBox(
//                 child:Text( courseDto.excerpt,
//                   style: Styles.getTextStyle(fontSize: 16),
//                   textAlign: TextAlign.start ,
//                 )
//             )
//
//           ],
//         ),
//       ),
//     );
//   }
//
// }
