import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class WBottomBarItem extends StatelessWidget {
  final String icon;
  final GestureTapCallback onTap;

  const WBottomBarItem({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        child: SvgPicture.asset(
          icon,
          // width: 21,
          // height: 21,
        ),
      ),
    );
  }
}
