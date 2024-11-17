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
  static TextStyle getSignOutTextStyle() => const TextStyle(
        color: AppColors.primaryTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: "Poppins",
      );
  static TextStyle getSignOutSubTextStyle() => const TextStyle(
        color: AppColors.subTextColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: "Poppins",
      );

  static TextStyle getNotificationTitle() => const TextStyle(
        color: AppColors.primaryTextColor,
        fontSize: 14,
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
      static TextStyle getAppbarStyle() => const TextStyle(
        color: AppColors.primaryTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: "Poppins",
      );

      static TextStyle getResultTextStyle() => const TextStyle(
        color: AppColors.primaryTextColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: "Poppins",
      );
      static TextStyle getResultInfoGuide() => const TextStyle(
        color: AppColors.subTextColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: "Poppins",
      );

      static TextStyle getDialogTitle() => const TextStyle(
        color: AppColors.C_070707,
        fontSize: 24,
        fontWeight: FontWeight.w600,
        fontFamily: "Poppins",
      );  static TextStyle getDialogText() => const TextStyle(
        color: AppColors.C_070707,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        fontFamily: "Poppins",
      );
      static TextStyle getCorrectAnswersStyle() => const TextStyle(
        color: AppColors.white,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: "Poppins",
      );

      static TextStyle getNoNotificationStyle() => const TextStyle(
        color: AppColors.primaryTextColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: "Poppins",
      );
      static TextStyle getChatItemSubtitleStyle() =>  TextStyle(
        color: AppColors.chatItemSubColor.withOpacity(.5),
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: "Poppins",
      );
      static TextStyle getChatItemTitle() =>  const TextStyle(
        color: AppColors.chatItemTitleColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: "Poppins",
      );
      static TextStyle getChatCountStyle() =>  const TextStyle(
        color: AppColors.white,
        fontSize: 12,
        fontWeight: FontWeight.w900,
        fontFamily: "Poppins",
      );
      static TextStyle getProfileTitle() =>  const TextStyle(
        color: AppColors.white,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: "Poppins",
      );
      static TextStyle getProfileSubTitle() =>  const TextStyle(
        color: AppColors.white,
        fontSize: 12,
        fontWeight: FontWeight.w400,
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
