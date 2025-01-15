import 'package:flutter/material.dart';
import 'package:math_app/core/resources/all_resources.dart';

abstract class SnackbarHelper {
  static void _showSnackbar({
    required BuildContext context,
    required String text,
    required Color backgroundColor,
    int duration = 3,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: Text(
          text,
          style: TextStyle(color: AppColors.white),
        ),
        duration: Duration(seconds: duration),
      ),
    );
  }

  static void showSuccess({
    required BuildContext context,
    required String text,
    int duration = 3,
  }) {
    _showSnackbar(
      context: context,
      text: text,
      backgroundColor: AppColors.green,
      duration: duration,
    );
  }

  static void showError({
    required BuildContext context,
    required String text,
    int duration = 3,
  }) {
    _showSnackbar(
      context: context,
      text: text,
      backgroundColor: AppColors.danger,
      duration: duration,
    );
  }
}
