import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../resources/app_colors.dart';

class WLoader extends StatelessWidget {
  const WLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return kIsWeb || Platform.isAndroid
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: const CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: const CupertinoActivityIndicator(),
          );
  }
}
