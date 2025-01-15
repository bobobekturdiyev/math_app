import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/styles.dart';
import '../widgets/w_button.dart';
import '../widgets/w_text_link.dart';
import 'helpers.dart';

abstract class DialogHelper {
  static Future<bool?> show({
    required BuildContext context,
    required String title,
    required String message,
    List<Widget> actions = const [],
  }) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          child: Container(
            width: 350,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 4),
                Text(title, style: Styles.getDialogTitle()),
                const SizedBox(height: 20),
                Text(message, style: Styles.getDialogText()),
                const SizedBox(height: 20),
                Row(children: actions),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<bool?> loginDialog(
      {required BuildContext context, required String message}) {
    return show(
        context: context,
        title: "Tizimga kirish",
        message: message,
        actions: [
          WButton(
            verticalPadding: 12,
            horizontalPadding: 24,
            textStyle: Styles.getButtonStyle(),
            onTap: () {
              Helper.openLogin(context);
            },
            text: 'Tizimga kirish'.toUpperCase(),
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
        ]);
  }
}
