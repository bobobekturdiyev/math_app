import 'package:flutter/material.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/styles.dart';

class WFilterGroup extends StatefulWidget {
  final Axis axis;
  final List<String> items;
  final int? initialIndex;
  final Function(int) onChange;
  final double? horizontalPadding;
  final EdgeInsets? margin;

  const WFilterGroup({
    Key? key,
    this.axis = Axis.horizontal,
    required this.items,
    this.initialIndex=0,
    this.horizontalPadding,
    required this.onChange,  this.margin,
  }) : super(key: key);

  @override
  State<WFilterGroup> createState() => _WFilterGroupState();
}

class _WFilterGroupState extends State<WFilterGroup> {
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
      return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        scrollDirection: Axis.horizontal,
        child: Row(

          children: _getChildren(),
        ),
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
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onChange(selectedIndex);
            },
            child: _buildChild(
              text: widget.items[index],
              isSelected: selectedIndex == index,
            ),
          ),
        ),
      );

  Widget _buildChild({required String text, required bool isSelected}) =>
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: isSelected ? AppColors.primaryColor : AppColors.white,
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : AppColors.borderColor,
          ),
        ),
        child: Text(
          text,
          style: Styles.getTextStyle(
            color: isSelected ? AppColors.white : AppColors.subTextColor,
          ),
        ),
      );
}
