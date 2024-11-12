import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/resources/app_colors.dart';
import '../resources/app_icons.dart';

enum SelectorType { radio, checkbox }

class WSelectButton extends StatelessWidget {
  final bool isSelected;
  final String txt;
  final SelectorType selectorType;

  const WSelectButton({
    Key? key,
    this.isSelected = false,
    required this.txt,
    this.selectorType = SelectorType.radio,
  }) : super(key: key);

  _getRadioDecoration() => BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? AppColors.primaryColor : AppColors.grey,
          width: 2,
        ),
      );

  _getCheckBoxDecoration() => BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: isSelected ? AppColors.primaryColor : null,
      border: !isSelected ? Border.all(color: AppColors.grey, width: 1) : null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          isSelected && selectorType == SelectorType.checkbox
              ? SvgPicture.asset(
                  AppIcons.smile,
                  width: 24,
                  height: 24,
                )
              : Container(
                  width: 24,
                  height: 24,
                  alignment: Alignment.center,
                  decoration: selectorType == SelectorType.radio
                      ? _getRadioDecoration()
                      : _getCheckBoxDecoration(),
                  child: isSelected && selectorType == SelectorType.radio
                      ? Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                          ),
                        )
                      : null,
                ),
          const SizedBox(width: 12),
          Text(
            txt,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF070707),
            ),
          ),
        ],
      ),
    );
  }
}
