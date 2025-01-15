import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/resources/app_colors.dart';
import '../resources/app_icons.dart';

enum SelectorType { radio, checkbox }

class WSelectButton extends StatelessWidget {
  final bool isSelected;
  final Color? color;
  final String txt;
  final TextStyle? style;
  final EdgeInsets? margin;
  final SelectorType selectorType;
  final String? image;

  const WSelectButton({
    Key? key,
    this.isSelected = false,
    required this.txt,
    this.selectorType = SelectorType.radio,
    this.style,
    this.margin,
    this.color,
    this.image,
  }) : super(key: key);

  _getRadioDecoration() => BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color:
              color ?? (isSelected ? AppColors.primaryColor : AppColors.grey),
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
      padding: margin ?? const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          isSelected && selectorType == SelectorType.checkbox
              ? SvgPicture.asset(
                  AppIcons.smile,
                  width: 20,
                  height: 20,
                )
              : Container(
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  decoration: selectorType == SelectorType.radio
                      ? _getRadioDecoration()
                      : _getCheckBoxDecoration(),
                  child: isSelected && selectorType == SelectorType.radio
                      ? Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: color ?? AppColors.primaryColor,
                          ),
                        )
                      : null,
                ),
          const SizedBox(width: 12),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  txt,
                  style: style ??
                      const TextStyle(
                        fontSize: 1,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF070707),
                      ),
                ),
                if (image != null) ...{
                  SizedBox(
                    height: 16,
                  ),
                  _buildImageContent(image!),
                },
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageContent(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 150),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.fitWidth,
          // width: double.infinity,
          errorWidget: (ctx, str, obj) {
            return const Center(
              child: Icon(Icons.image, color: AppColors.grey),
            );
          },
        ),
      ),
    );
  }
}
