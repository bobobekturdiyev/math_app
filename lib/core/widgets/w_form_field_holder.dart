import 'package:flutter/material.dart';

import '../resources/app_colors.dart';

class WFormFieldHolder extends StatelessWidget {
  final Widget child;
  final double verticalPadding;
  final bool isError;

  const WFormFieldHolder({
    Key? key,
    required this.child,
    this.verticalPadding = 0,  this.isError=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: verticalPadding,
      ),
      margin: const EdgeInsets.only(bottom: 16, top: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: isError? AppColors.danger.withOpacity(0.1):Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
        border: Border.all(
          color:isError? AppColors.danger.withOpacity(0.2): AppColors.C_CACACA,
        ),
      ),
      child: child,
    );
  }
}
