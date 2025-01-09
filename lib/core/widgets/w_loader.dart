import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/app_colors.dart';

class WLoader extends StatelessWidget {
  const WLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid ? const CircularProgressIndicator(color: AppColors.primaryColor,) : const CupertinoActivityIndicator();
  }
}
