import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../resources/styles.dart';

class WUserProfile extends StatelessWidget {
  const WUserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 16,
          backgroundImage: CachedNetworkImageProvider("https://cdn.pixabay.com/photo/2021/08/04/13/06/software-developer-6521720_1280.jpg"),
        ),
        const SizedBox(width: 11,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Bobobek Turdiyev",style: Styles.getTextStyle(fontSize: 12),),
            Text("21.10.2023",style: Styles.getTextStyle(fontSize: 12,color: const Color(0xFF888888)),),
          ],
        )
      ],
    );
  }
}
