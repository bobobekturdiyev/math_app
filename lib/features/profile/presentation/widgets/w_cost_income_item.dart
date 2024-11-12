import 'package:flutter/material.dart';
import 'package:math_app/core/resources/app_images.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/styles.dart';
class WCostIncomeItem extends StatelessWidget {
  const WCostIncomeItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                blurRadius: 15,
                offset: const Offset(0, 5),
                color: Colors.black.withOpacity(0.05)
            ),]

      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.payme,
            width: 64,
            height: 64,
          ),
          const SizedBox(width: 8,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  "-7 115 000 so’m",
                  style: Styles.getTextStyle(
                    color: AppColors.pink,
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  "25.01.2021 | 22:26",
                  style: Styles.getTextStyle(
                    color: const Color(0xFF8A8A93),
                      fontSize: 12,),
                ),
                Text("Lorem ipsum dolor sit amet consectetur. ",style: Styles.getTextStyle(),)
              ],
            ),
          )
        ],
      ),

    );
  }
}
