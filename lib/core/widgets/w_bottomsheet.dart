import 'package:flutter/material.dart';
import 'package:math_app/core/widgets/w_close_button.dart';

import '../resources/app_colors.dart';
import '../resources/styles.dart';

class WBottomSheet extends StatelessWidget {
  final String title;
  final Widget? prefix;
  final Widget? body;

  const WBottomSheet({
    Key? key,
    required this.title,
    this.body,
    this.prefix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(28),
                topRight: Radius.circular(28),
              ),),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      if (prefix != null) ...{
                        prefix!,
                        const SizedBox(width: 12),
                      },
                      Text(
                        title,
                        style: Styles.getTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  const WCloseButton(),
                ],
              ),
              const SizedBox(height: 16),
              if (body != null) ...{
                body!,
              },
            ],
          ),
        ),
      ],
    );
  }
}
// Wrap(
// children: [
// Container(
// padding: const EdgeInsets.only(top: 16,right: 20,left: 20),
// decoration: const BoxDecoration(
// borderRadius: BorderRadius.only(
// topRight: Radius.circular(16),
// topLeft: Radius.circular(16))),
// child:  Column(
// children: [
// Container(
// width:  52,
// height: 2,
// decoration: BoxDecoration(
// color: const Color(0xFF8A8A93),
// borderRadius: BorderRadius.circular(12),
// ),
// ),
// if(body!=null)...{
// body!
// }],
// ),
// ),
// ],
// )
