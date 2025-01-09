import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/app_icons.dart';
import '../../../../core/widgets/w_textfield.dart';

class WSearch extends StatefulWidget {
  final Function(String) onSubmitted;

  const WSearch({super.key, required this.onSubmitted});

  @override
  State<WSearch> createState() => _WSearchState();
}

class _WSearchState extends State<WSearch> {
  TextEditingController controller = TextEditingController();
  bool showClear = false;

  @override
  Widget build(BuildContext context) {
    return WTextField(
      controller: controller,
      onChanged: (str) {
        if (str.isNotEmpty && !showClear) {
          setState(() {
            showClear = true;
          });
        } else if (str.isEmpty && showClear) {
          setState(() {
            showClear = false;
          });
        }
      },
      hint: "search".tr(),
      hintFontSize: 12,
      prefixIcon: SvgPicture.asset(
        AppIcons.search,
        fit: BoxFit.none,
      ),
      onSubmitted: (str) => widget.onSubmitted(str),
      suffixIcon: showClear
          ? GestureDetector(
              onTap: () {
                setState(() {
                  controller.text = "";
                  showClear = false;
                });
              },
              child: SvgPicture.asset(
                AppIcons.close,
                fit: BoxFit.none,
              ),
            )
          : null,
      textInputAction: TextInputAction.search,
    );
  }
}
