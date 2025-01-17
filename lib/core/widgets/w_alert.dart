import 'package:flutter/material.dart';
import 'package:math_app/core/resources/all_resources.dart';

class WAlert extends StatelessWidget {
  final String message;
  final bool isError;

  const WAlert({super.key, required this.message, this.isError = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isError ? AppColors.pinkAccent : AppColors.green,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        message,
        style: TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
