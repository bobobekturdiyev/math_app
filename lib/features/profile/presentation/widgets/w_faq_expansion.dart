import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/resources/styles.dart';

class WFaqExpansion extends StatefulWidget {
  final String title;
  final String bodyText;
  final EdgeInsets? margin;

  const WFaqExpansion(
      {super.key, required this.title, required this.bodyText, this.margin});

  @override
  State<WFaqExpansion> createState() => _WFaqExpansionState();
}

class _WFaqExpansionState extends State<WFaqExpansion> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ?? const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: AppColors.C_FAFAFA,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.C_FAFAFA,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: isOpen
                        ? AppColors.primaryColor
                        : AppColors.transparent)),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: Styles.getTextStyle(),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isOpen = !isOpen;
                    });
                  },
                  child: SvgPicture.asset(
                    isOpen ? AppIcons.minus : AppIcons.plus,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF697B7A),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          ),
          AnimatedSize(
              curve: Curves.ease,
              duration: const Duration(milliseconds: 300),
              child: isOpen
                  ? Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        widget.bodyText,
                        style: Styles.getTextStyle(
                          fontSize: 12,
                          color: AppColors.subTextColor,
                        ),
                      ),
                    )
                  : const SizedBox())
        ],
      ),
    );
  }
}
