
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math_app/features/profile/data/model/plan_dto/plan_dto.dart';
import 'package:math_app/features/profile/presentation/widgets/w_gradient_text.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_icons.dart';
import '../../../../core/resources/styles.dart';
import '../../../../core/widgets/w_button.dart';

class WPlanItem extends StatefulWidget {
  final GestureTapCallback onTap;
  final PlanDto plan;
  final bool isYear;
  final List<Color> colors;
  const WPlanItem({Key? key, required this.onTap, required this.plan,  this.isYear=false, required this.colors}) : super(key: key);

  @override
  State<WPlanItem> createState() => _WPlanItemState();
}

class _WPlanItemState extends State<WPlanItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20,right: 24),
          padding: const EdgeInsets.only(
            top: 32,
            left: 32,
            right: 32,
            bottom: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient:  LinearGradient(
              colors: widget.colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),

          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.plan.name.toUpperCase(),
                style: Styles.getTextStyle(
                    fontSize: 16, color: AppColors.white),
              ),
              const SizedBox(height: 8,),
              Text(
                "${ widget.plan.price} so’m",
                style: Styles.getTextStyle(
                    fontSize: 28, fontWeight: FontWeight.w600,color: AppColors.white),
              ),
              const SizedBox(height: 28,),

              const SizedBox(height: 28,),
              ...List.generate(
                widget.plan.planItem.length,
                    (index) =>
                    _buildRow(widget.plan.planItem[index].text,
                        status: widget.plan.planItem[index].checkBox
                    ),
              ),
              const SizedBox(height: 28,),
              WButton(
                text: '',
                onTap:widget.onTap,
                borderRadius: 12,
                horizontalPadding: 46,
                color: AppColors.white,
                child: GradientText(
                  "Kursga qo’shilish",
                  style: Styles.getTextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor),
                  gradient:  LinearGradient(
                    colors: widget.colors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              const SizedBox(height: 12,),
           if(widget.isYear)...  {
                SizedBox(
                  width: 220,
                  child: RichText(
                    text: TextSpan(
                        text: "5 kun ",
                        style: Styles.getTextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: AppColors.white),
                        children: [
                          TextSpan(
                            text:
                                "ichida sizga to'g'ri kelmasligini bilsangiz,pulingizni 100% ",
                            style: Styles.getTextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: AppColors.white),
                          ),
                          TextSpan(
                            text: "qaytarish kafolatlanadi! ",
                            style: Styles.getTextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: AppColors.white),
                          )
                        ]),
                  ),
                )
              }else...{
             Align(
               alignment: Alignment.center,
               child: Text(
                 "Cancel anytime!",
                 style: Styles.getTextStyle(
                     fontWeight: FontWeight.w300,
                     fontSize: 12,
                     color: AppColors.white),
               ),
             )

           }
            ],
          ),
        ),
        if(widget.isYear)...{
          Positioned(
            top: 16,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.2),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(6),
                    bottomLeft: Radius.circular(6),
                  )),
              child: Text(
                "2 oy bepul",
                style: Styles.getTextStyle(color: AppColors.white),
              ),
            ),
          )
        }
      ],
    );
  }
  Widget _buildRow(String title, {int status=0} ){
    return   Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          SvgPicture.asset(status==1? AppIcons.check:AppIcons.X),
          const SizedBox(width: 12,),
          Expanded(
              child: Text(
                title,
                style: Styles.getTextStyle(
                    fontWeight: FontWeight.w300, color: AppColors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ))
        ],
      ),
    );
  }
}
