import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/widgets/w_appbar.dart';
import 'package:math_app/core/widgets/w_button.dart';
import 'package:math_app/core/widgets/w_textfield.dart';

@RoutePage()
class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: WAppBar(
        title: "change_password".tr(),
        trailing: SvgPicture.asset(AppIcons.dotsBadge),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    WTextField(
                      prefixIcon: SvgPicture.asset(
                        AppIcons.lock,
                        fit: BoxFit.none,
                      ),
                      isObscure: true,
                      label: "current_password".tr(),
                      hint: "current_password".tr(),
                      controller: controller,
                    ),
                    WTextField(
                      prefixIcon: SvgPicture.asset(
                        AppIcons.lock,
                        fit: BoxFit.none,
                      ),
                      isObscure: true,
                      label: "new_password".tr(),
                      hint: "new_password".tr(),
                      controller: controller,
                    ),
                    WTextField(
                      prefixIcon: SvgPicture.asset(
                        AppIcons.lock,
                        fit: BoxFit.none,
                      ),
                      isObscure: true,
                      label: "confirm_password".tr(),
                      hint: "confirm_password".tr(),
                      controller: controller,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: WButton(
                verticalPadding: 10,
                text: "new_password_save".tr(),
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
