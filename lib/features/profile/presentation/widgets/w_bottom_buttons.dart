import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/w_button.dart';
import '../../../../core/widgets/w_text_link.dart';
class WBottomButtons extends StatelessWidget {
  final GestureTapCallback onTap;

  const WBottomButtons({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration:
          const BoxDecoration(border: Border(top: BorderSide(width: 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WTextLink(
              text: "BEKOR QILISH",
              onTap: () {
                context.router.pop();
              }),
          WButton(
              text: "SAQLASH",
              onTap: onTap,)
        ],
      ),
    );
  }
}
