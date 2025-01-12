import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../di/locator.dart';
import '../resources/app_lottie.dart';
import 'w_button.dart';

class WNonAuth extends StatelessWidget {
  final String text;
  final GestureTapCallback onLoginTap;

  const WNonAuth({
    super.key,
    required this.text,
    required this.onLoginTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset(AppLottie.login, width: 250),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: locator<ThemeData>().textTheme.headlineSmall,
          ),
        ),
        WButton(
          text: "Tizimga kirish",
          onTap: onLoginTap,
        ),
      ],
    );
  }
}
