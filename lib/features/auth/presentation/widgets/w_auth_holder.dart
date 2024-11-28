import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';

class WAuthHolder extends StatelessWidget {
  final double windowHeight;
  final double scaleFactor;
  final List<Widget> formElements;
  final List<Widget> footerElements;

  const WAuthHolder({
    Key? key,
    required this.windowHeight,
    required this.formElements,
    required this.footerElements,
    this.scaleFactor = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: windowHeight,
      child: Column(
        children: [
          SizedBox(height: scaleFactor * 60),
          // const WLogo(),
          SizedBox(height: scaleFactor * 52),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: scaleFactor * 30.0,
                vertical: scaleFactor * 52,
              ),
              margin: EdgeInsets.symmetric(horizontal: scaleFactor * 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: formElements,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: scaleFactor * 16),
            padding: EdgeInsets.symmetric(horizontal: scaleFactor * 28),
            color: AppColors.white,
            child: Column(
              children: footerElements,
            ),
          ),
        ],
      ),
    );
  }
}
