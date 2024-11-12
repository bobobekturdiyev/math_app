import 'package:flutter/material.dart';
import 'package:math_app/core/widgets/w_select_button.dart';

class WCheckboxGroup extends StatefulWidget {
  final Axis axis;
  final List<String> items;
  final Function(List<int>) onChange;
  final NullableIndexedWidgetBuilder? trailing;
  final double? runSpacing;
  final double? spacing;

  const WCheckboxGroup({
    super.key,
    this.axis = Axis.vertical,
    required this.items,
    required this.onChange,
    this.trailing,
    this.runSpacing,
    this.spacing,
  });

  @override
  State<WCheckboxGroup> createState() => WCheckboxGroupState();
}

class WCheckboxGroupState extends State<WCheckboxGroup> {
  List<int> selectedIndexes = [];

  /// Tashqaridan chaqirish uchun `selectAll` va `deselectAll` funksiyalari
  void selectAll() {
    setState(() {
      selectedIndexes = List.generate(widget.items.length, (index) => index);
    });
    widget.onChange(selectedIndexes);
  }

  void deselectAll() {
    setState(() {
      selectedIndexes.clear();
    });
    widget.onChange(selectedIndexes);
  }

  @override
  Widget build(BuildContext context) {
    return widget.axis == Axis.vertical
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: _getChildren(),
          )
        : Wrap(
            direction: widget.axis,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            runAlignment: WrapAlignment.start,
            spacing: widget.spacing ?? 10,
            runSpacing: widget.runSpacing ?? 10,
            children: _getChildren(),
          );
  }

  List<Widget> _getChildren() => List.generate(
        widget.items.length,
        (index) => Padding(
          padding: EdgeInsets.only(
            bottom: 24.0,
            right: widget.axis == Axis.horizontal ? 8.0 : 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (selectedIndexes.contains(index)) {
                        selectedIndexes.remove(index);
                      } else {
                        selectedIndexes.add(index);
                      }
                    });
                    widget.onChange(selectedIndexes);
                  },
                  child: WSelectButton(
                    txt: widget.items[index],
                    isSelected: selectedIndexes.contains(index),
                    selectorType: SelectorType.checkbox,
                  ),
                ),
              ),
              if (widget.trailing != null) ...{
                widget.trailing!(context, index) ?? const SizedBox(),
              },
            ],
          ),
        ),
      );
}
