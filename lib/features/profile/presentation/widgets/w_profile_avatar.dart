import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:math_app/core/resources/app_colors.dart';

class WProfileAvatar extends StatelessWidget {
  final String? imageUrl;
  final Color? borderColor;
  final double? borderWidth;
  const WProfileAvatar({super.key, this.borderColor,  this.borderWidth,  this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return

      Container(
        padding:  EdgeInsets.all(borderWidth??3),
        height: 82,
        width: 82,
        decoration:  BoxDecoration(
          shape: BoxShape.circle,
          color: borderColor,
          boxShadow:borderColor==null? [ BoxShadow(
              color: AppColors.black.withOpacity(.04),
              blurRadius: 42,
              spreadRadius: 0,
              offset: const Offset(0, 24)
          ),]:null,
          gradient: borderColor==null? const LinearGradient(

            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFC77C),
              Color(0xFF88FFF4),
            ],
          ):null,
        ),
        child:  CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(imageUrl??'https://i0.wp.com/digitalhealthskills.com/wp-content/uploads/2022/11/3da39-no-user-image-icon-27.png?fit=500%2C500&ssl=1'),
        ),
      );
  }
}
