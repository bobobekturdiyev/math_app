import 'package:flutter/material.dart';
import 'package:math_app/core/widgets/w_removable_chip.dart';

class WChipGroup extends StatefulWidget {
  final List<String> items;
  final GestureTapCallback closeTap;

  const WChipGroup({
    Key? key,
    required this.items, required this.closeTap,
  }) : super(key: key);

  @override
  State<WChipGroup> createState() => _WChipGroupState();
}

class _WChipGroupState extends State<WChipGroup> {
  List<String> _items = [];

  @override
  void initState() {
    _items = widget.items;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.start,
      spacing: 10,
      children: List.generate(
          _items.length,
          (index) => WRemovableChip(
                title: _items[index],
                onCloseTap: () {
                  widget.closeTap();
                  _items.removeAt(index);
                  setState(() {});
                },
              )),
    );
  }
}
