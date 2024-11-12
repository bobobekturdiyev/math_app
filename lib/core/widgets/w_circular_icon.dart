import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WCircularIcon extends StatelessWidget {
  final String icon;
  final Color color;
  final double size;

  const WCircularIcon({
    Key? key,
    required this.icon,
    required this.color,
    this.size = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(size / 4.5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.1),
      ),
      child: SvgPicture.asset(
        icon,
        width: size / 2,
        height: size / 2,
        colorFilter: ColorFilter.mode(
          color,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
