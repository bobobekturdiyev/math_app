import 'package:flutter/cupertino.dart';

import 'app_colors.dart';

abstract class Styles {
  Styles._();

  static TextStyle getButtonStyle() => const TextStyle(
        color: AppColors.white,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: "Poppins",
      );

  static TextStyle getHiUserStyle() => const TextStyle(
        color: AppColors.primaryTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: "Poppins",
      );


  static TextStyle getCourseTitleStyle() => const TextStyle(
        color: AppColors.primaryTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: "Poppins",
      );

  static TextStyle getActivePriceStyle() => const TextStyle(
        color: AppColors.primaryColor,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        fontFamily: "Poppins",
      );

  static TextStyle getDeActivePriceStyle() => const TextStyle(
        color: AppColors.subTextColor,
        decoration: TextDecoration.lineThrough,
        fontSize: 10,
        fontWeight: FontWeight.w400,
        fontFamily: "Poppins",
      );
  static TextStyle getCourseAboutTextStyle() => const TextStyle(
        color: AppColors.subTextColor,

        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: "Poppins",
      ); static TextStyle getLessonIndexStyle() => const TextStyle(
        color: AppColors.primaryColor,

        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: "Poppins",
      );
      static TextStyle getLessonTitle() => const TextStyle(
        color: AppColors.primaryTextColor,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        fontFamily: "Poppins",
      );   static TextStyle getLessonSubTitle() => const TextStyle(
        color: AppColors.subTextColor,
        fontSize: 10,
        fontWeight: FontWeight.w400,
        fontFamily: "Poppins",
      );



      static TextStyle courseSectionStyle() => const TextStyle(
        color: AppColors.subTextColor,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        fontFamily: "Poppins",
      );


  static TextStyle getTextStyle({
    Color color = AppColors.primaryTextColor,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    double? letterSpacing,
    double? height,
  }) =>
      TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: "Poppins",
        letterSpacing: letterSpacing,
        height: height,
      );
}
