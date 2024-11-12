import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/resources/styles.dart';
class WWrap extends StatelessWidget {
  final bool isBorder;
 final Widget child;
 final bool isAdd;
 final GestureTapCallback onTap;
 final String title;

  const WWrap(
      {Key? key,
      this.isBorder = false,
      required this.child,
      required this.title,
      required this.onTap,
      this.isAdd = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: isBorder?AppColors.wrapColor2:AppColors.wrapColor,

        borderRadius: BorderRadius.circular(16),
          border:Border.all(width: 1,color:isBorder? AppColors.wrapBorder:AppColors.transparent)

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Styles.getTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: isBorder?AppColors.primaryColor:const Color(0xff2F2F3B)
                ),
              ),
              GestureDetector(
                onTap:onTap ,
                child: isAdd
                    ? SvgPicture.asset(
                        AppIcons.add,
                        colorFilter: const ColorFilter.mode(
                            AppColors.grey, BlendMode.srcIn),
                  width: 16,
                  height:18,
                      )
                    : SvgPicture.asset(AppIcons.pencil),
              )


            ],
          ),
          const SizedBox(height: 16,),
          child

        ],
      ),
    );
  }
}
