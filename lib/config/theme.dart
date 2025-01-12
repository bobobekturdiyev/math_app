import 'package:flutter/material.dart';

import '../core/resources/app_colors.dart';
import '../core/resources/styles.dart';

abstract class AppTheme {
  static ThemeData light() => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        appBarTheme: AppBarTheme(backgroundColor: AppColors.white),
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
          headlineSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
        ),
        dialogTheme: DialogTheme(
          backgroundColor: AppColors.backgroundColor,
          titleTextStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
        ),
        primaryColor: AppColors.primaryColor,
        primaryColorDark: AppColors.primaryColorDark,
        inputDecorationTheme: InputDecorationTheme(
          fillColor: AppColors.fieldColor,
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          hintStyle: Styles.getTextStyle(
            color: AppColors.subTextColor,
            letterSpacing: 1,
            fontSize: 14,
          ),
          errorStyle: Styles.getTextStyle(
            fontSize: 14,
            color: AppColors.danger,
          ),
          outlineBorder: BorderSide(color: AppColors.borderColor, width: 1),
          enabledBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide: BorderSide(color: AppColors.borderColor, width: 1),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide:
                BorderSide(color: AppColors.primaryColorAccent, width: 1),
            borderRadius: BorderRadius.circular(16),
          ),
          errorBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide: BorderSide(color: AppColors.danger, width: 1),
            borderRadius: BorderRadius.circular(16),
          ),
          border: OutlineInputBorder(
            gapPadding: 0,
            borderSide:
                BorderSide(color: AppColors.primaryColorAccent, width: 1),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      );
}
