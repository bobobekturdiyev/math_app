import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:math_app/config/routes/route_path.dart';
import 'package:math_app/config/routes/router.gr.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/resources/styles.dart';
import 'package:math_app/core/widgets/w_appbar.dart';
import 'package:math_app/core/widgets/w_button.dart';
import 'package:math_app/core/widgets/w_cupertino_switch.dart';
import 'package:math_app/features/profile/presentation/widgets/w_profile_section_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: WAppBar(
        title: "settings".tr(),
        trailing: SvgPicture.asset(
          AppIcons.dotsBadge,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "main".tr(),
                    style: Styles.getTextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  // WProfileSectionItem(
                  //   leadingIconPath: AppIcons.lock,
                  //   title: "change_password".tr(),
                  //   onTap: () {
                  //     context.router.pushNamed(RoutePath.changePassword);
                  //   },
                  // ),
                  WProfileSectionItem(
                    leadingIconPath: AppIcons.help,
                    title: "FAQ".tr(),
                    onTap: () {
                      context.router.pushNamed(RoutePath.FAQ);
                    },
                  ),
                  WProfileSectionItem(
                    leadingIconPath: AppIcons.location,
                    title: "privacy_policy".tr(),
                    onTap: () {
                      context.router.pushNamed(RoutePath.privacyPolicy);

                    },
                  ),
                  Text(
                    "notification".tr(),
                    style: Styles.getTextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  WProfileSectionItem(
                    leadingIconPath: AppIcons.shield,
                    title: "notification_of_app".tr(),
                    onTap: () {},
                    trailing: SizedBox(
                      width: 54,
                      height: 32,
                      child:WCupertinoSwitch(onChanged: (bool value) {  },)
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: InkWell(
              onTap: () {
                _showLogoutModalBottomSheet(context);
              },
              child: Row(
                children: [
                  SvgPicture.asset(AppIcons.logoutCircleFill),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    "log_out".tr(),
                    style: Styles.getTextStyle(),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showLogoutModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 44),
          width: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min  ,
            children: [

              SvgPicture.asset(AppIcons.logOut),
              const SizedBox(
                height: 32,
              ),
              Text(
                "sign_out".tr(),
                style: Styles.getHiUserStyle(),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "are_you_sure_you_want_to_leave".tr(),
                style: Styles.getSignOutSubTextStyle(),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Expanded(
                    child: WButton(
                        verticalPadding: 10,
                        text: "back".tr(), onTap: (){
                        ctx.maybePop();
                    }),
                  ),
                  const SizedBox(width: 15,),
                  Expanded(
                    child: WButton(
                      buttonType: ButtonType.outline,
                        color: AppColors.danger,
                        verticalPadding: 10,
                        text: "out".tr(),
                        textStyle: Styles.getButtonStyle().copyWith(color: AppColors.danger),
                        onTap: () async {
                          SharedPreferences preferences = await SharedPreferences.getInstance();
                          await preferences.clear();
                          context.router.replaceAll([const LoginRoute()]);
                        }),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
