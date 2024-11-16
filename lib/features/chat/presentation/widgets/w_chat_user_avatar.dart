import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WChatUserAvatar extends StatelessWidget {
  final double radius;
  const WChatUserAvatar({super.key,  this.radius=26});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        CircleAvatar(
          radius: radius,
          backgroundImage: const CachedNetworkImageProvider(
              "https://ntrepidcorp.com/wp-content/uploads/2016/06/team-1-640x640.jpg"),
        ),
        const Positioned(
          bottom: 2,
          right: 6,
          child: CircleAvatar(
            radius: 4,
            backgroundColor: Colors.green,
          ),
        ),
      ],
    );
  }
}
