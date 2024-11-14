import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/app_icons.dart';
import '../resources/styles.dart';

class WAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String?  logo;
  final String title;


  const WAppBar({
    Key? key,  this.logo, required this.title,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child:Row(
        children: [

          GestureDetector(
            onTap: (){context.router.maybePop();},
            child:SvgPicture.asset(AppIcons.arrowLeftBadge),

          ),
          if(logo!=null)...{
            Image.asset(logo!,width: 28,height: 28,)

          },
          const SizedBox(width: 16,),
          Text( title,style: Styles.getTextStyle(fontSize: 16),)
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity,200);
}
