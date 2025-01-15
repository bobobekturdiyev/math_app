import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/styles.dart';
import 'package:math_app/core/util/dialog_helper.dart';
import 'package:math_app/core/widgets/w_button.dart';
import 'package:math_app/core/widgets/w_text_link.dart';

Future<bool?> showBackDialog(BuildContext context) {
  return DialogHelper.show(
    context: context,
    title: "Testdan chiqish",
    message: "Hali test yakunlanmadi, chiqib ketasizmi?",
    actions: [
      Flexible(
        child: WTextLink(
          margin: const EdgeInsets.symmetric(vertical: 8),
          text: "Orqaga".toUpperCase(),
          color: AppColors.C_A1A1A1,
          onTap: () => Navigator.pop(context, false),
        ),
      ),
      const SizedBox(width: 20),
      WButton(
        verticalPadding: 12,
        horizontalPadding: 24,
        color: AppColors.danger,
        textStyle: Styles.getButtonStyle(),
        onTap: () {
          Navigator.pop(context, true);
          Navigator.pop(context, true);
        },
        text: 'Chiqish'.toUpperCase(),
      ),
    ],
  );
}

Future<bool?> showFinishDialog(BuildContext context,
    {required GestureTapCallback onTap}) {
  return DialogHelper.show(
    context: context,
    title: "Testni yakunlash",
    message: "Haqiqatda ham testni yakunlashni xohlaysizmi?",
    actions: [
      WButton(
        verticalPadding: 12,
        horizontalPadding: 24,
        textStyle: Styles.getButtonStyle(),
        onTap: onTap,
        text: 'Ha, yakunlash'.toUpperCase(),
      ),
      const SizedBox(width: 20),
      Flexible(
        child: WTextLink(
          margin: const EdgeInsets.symmetric(vertical: 8),
          text: "ortga qaytish".toUpperCase(),
          color: AppColors.C_A1A1A1,
          onTap: () => context.router.maybePop(),
        ),
      ),
    ],
  );
}
