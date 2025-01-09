import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';

class WCategory extends StatelessWidget {
  final String text;
  final bool isActive;
  final GestureTapCallback onTap;

  const WCategory({
    super.key,
    required this.text,
    this.isActive = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
            color: isActive ? AppColors.primaryColor : null,
            borderRadius: BorderRadius.circular(32)),
        child: Text(
          text,
          style: TextStyle(
            color: isActive ? AppColors.white : AppColors.grey,
          ),
        ),
      ),
    );
  }
}
