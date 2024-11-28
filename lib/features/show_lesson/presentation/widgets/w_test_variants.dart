import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/resources/styles.dart';
import 'package:math_app/core/widgets/w_select_button.dart';

class WTestVariants extends StatefulWidget {
  final Axis axis;
  final List<String> items;
  final int? initialIndex;
  final Function(int) onChange;
  final bool _disabled;
  final double? horizontalPadding;
  final int? _correctIndex;

  const WTestVariants({
    super.key,
    this.axis = Axis.vertical,
    required this.items,
    this.initialIndex,
    this.horizontalPadding,
    required this.onChange,
  })  : _correctIndex = null,
        _disabled = false;

  const WTestVariants.disabled({
    super.key,
    this.axis = Axis.vertical,
    required this.items,
    required this.initialIndex,
    this.horizontalPadding,
    required this.onChange,
    required int correctIndex,
  })  : _correctIndex = correctIndex,
        _disabled = true;

  @override
  State<WTestVariants> createState() => _WTestVariantsState();
}

class _WTestVariantsState extends State<WTestVariants> {

  @override
  void initState() {
    super.initState();
    if (widget.initialIndex != null) {
      selectedIndex = widget.initialIndex!;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.axis == Axis.vertical) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: _getChildren(),
      );
    } else {
      return Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        runAlignment: WrapAlignment.start,
        spacing: 10,
        runSpacing: 10,
        children: _getChildren(),
      );
    }
  }

  int selectedIndex = -1;

  _getChildren() => List.generate(
        widget.items.length,
        (index) => Padding(
          padding: EdgeInsets.only(
            bottom: widget.horizontalPadding == null
                ? 8.0
                : widget.horizontalPadding ?? 0,
            right: widget.axis == Axis.horizontal ? 8.0 : 0,
          ),
          child: GestureDetector(
            onTap: widget._disabled
                ? null
                : () {
                    setState(() {
                      selectedIndex = index;
                    });
                    widget.onChange(selectedIndex);
                  },
            child: Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: widget._disabled
                    ? (index == widget._correctIndex
                        ? AppColors.primaryColorAccent
                        : index == widget.initialIndex
                            ? AppColors.redAccent
                            : Colors.white)
                    : selectedIndex == index
                        ? AppColors.primaryColorAccent
                        : Colors.white,
                border: Border.all(
                  color: widget._disabled
                      ? (index == widget._correctIndex
                          ? AppColors.primaryColor
                          : index == widget.initialIndex
                              ? AppColors.danger
                              : AppColors.borderColor)
                      : selectedIndex == index
                          ? AppColors.primaryColor
                          : AppColors.borderColor,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WSelectButton(
                    color: widget._disabled
                        ? widget._correctIndex == index
                            ? AppColors.primaryColor
                            : widget.initialIndex == index
                                ? AppColors.danger
                                : AppColors.borderColor
                        : null,
                    margin: EdgeInsets.zero,
                    txt:
                        " ${widget.items.isEmpty ? '' : widget.items[index]}",
                    isSelected:widget._disabled? widget.initialIndex == index: selectedIndex == index,
                    style: Styles.getTextStyle(color: AppColors.black),
                  ),
                  if (widget._disabled&&(widget.initialIndex==index||widget._correctIndex==index))
                    SvgPicture.asset(
                      index == widget._correctIndex
                          ? AppIcons.variantCheckSuccess
                          : AppIcons.variantCheckFailure,
                    ),
                ],
              ),
            ),
          ),
        ),
      );
}
