import 'package:flutter/material.dart';

abstract class AppColors {
  //General
  static const Color primaryColor = Color(0xFF2EC4B6);
  static const Color primaryColorAccent = Color(0xFFD5F3F0);
  static const Color primaryColorDark = Color(0xFF00B5B2);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color primaryTextColor = Color(0xFF092724);
  static const Color lessonIndexCircleC = Color(0xFFF6FBFA);
  static const Color backBtnTextColor = Color(0xFFCED4D3);

  static const Color redAccent = Color(0xFFF3D5D5);
  static const Color yellow = Color(0xFFFFC746);
  static const Color currentCourseCardColor = Color(0xFFF6FBFA);
  static const Color blueAccent = Color(0xFF16C7F9);
  static const Color pink = Color(0xFFFF3364);
  static const Color green = Color(0xFF54BA4A);
  static const Color dateColor = Color(0xFFDBD6FE);

  static const Color transparent = Colors.transparent;
  static const Color buttonColor = Color(0xFF8ED4F7);
  static const Color subTextColor = Color(0xFF697B7A);
  static const Color wrapColor = Color(0xFFF6F7F9);
  static const Color wrapColor2 = Color(0xFFF2F2F2);
  static const Color wrapBorder = Color(0xFFF2F2F2);
    static const Color bottomIcon = Color(0xFF8A8A93);


    static const Color borderColor = Color(0xFFF4F4F4);

  static const Color inputColor = Color(0xFFFFFFFF);
  static const Color  backgroundColor = Color(0xFFEAFFF8);
  static const Color text2 = Color(0xFF52526C);
  static const Color text = Color(0xFF2F2F3B);
  static const Color lessonTabBar = Color(0xFFF1EFFF);

  static const Color grey = Color(0xFF999999);
  static const Color C_CACACA = Color(0xFFCACACA);
  static const Color C_11253C = Color(0xFF11253C);
  static const Color C_F9F9F9F9= Color(0xFFF9F9F9);
  static const Color C_D9D9D9= Color(0xFFD9D9D9);
  static const Color C_777777= Color(0xFF777777);
  static const Color C_070707= Color(0xFF070707);
  static const Color C_F7F7F7= Color(0xFFF7F7F7);
  static const Color C_A1A1A1= Color(0xFFA1A1A1);
  static const Color fieldColor= Color(0xFFFFFFFF);

  static const Color cardColor = Color(0xFFF8F7FB);

  static const Color danger = Color(0xFFE85E5E);
  static const Color removeColor = Color(0xFFFF002E);

  static const Color shimmerAnimate = Color(0xFF383838);
  static const Color shimmerAnimateLight = Color(0xFFEEEEEE);
  static const Color shimmerAnimatePrimaryLight = Color(0xFFFFFFFF);

  static const Color shimmerBack = Color(0xFF292929);
  static const Color shimmerBackLight = Color(0xFFFFFFFF);

  static Color getColorByName(String color) {
    switch (color.toUpperCase()) {
      case "BLUE":
        return const Color(0xFF0094FF);
      case "BLACK":
        return const Color(0xFF000000);
      case "PINK":
        return const Color(0xFFFF3C99);
      case "GREEN":
        return const Color(0xFF00FF57);
      case "RED":
        return const Color(0xFFFF002E);
      case "ORANGE":
        return const Color(0xFFFF9C40);
      case "YELLOW":
        return const Color(0xFFFFEC40);
      case "VIOLET":
        return const Color(0xFF9919D6);
      case "WHITE":
        return const Color(0xFFFFFFFF);
      case "GRAY":
        return const Color(0xFF939393);
    }

    return const Color(0xFFFFFFFF);
  }
}
