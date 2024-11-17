import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/widgets/w_appbar.dart';
import 'package:math_app/core/widgets/w_textfield.dart';
import 'package:math_app/features/profile/presentation/widgets/w_profile_avatar.dart';

@RoutePage()
class PersonalInfoScreen extends StatelessWidget {
  PersonalInfoScreen({super.key});

  final TextEditingController _fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WAppBar(
        title: "personal_information".tr(),
        trailing: SvgPicture.asset(
          AppIcons.checkRoundBadge,
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            Center(
              child: Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 3),
                    child: WProfileAvatar(
                      borderColor: AppColors.green,
                      borderWidth: 2,
                    ),
                  ),
                  Positioned(
                      right: 3,
                      bottom: 0,
                      child: SvgPicture.asset(AppIcons.cameraCircleFilled))
                ],
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            WTextField(
              prefixIcon: _buildTextFieldIcon(
                AppIcons.user,
              ),
              controller: _fullNameController,
              label: "full_name".tr(),
            ),
            WTextField(
              prefixIcon: _buildTextFieldIcon(
                AppIcons.message,
              ),
              suffixIcon:
                  _buildTextFieldIcon(AppIcons.check, color: AppColors.green),
              controller: _fullNameController,
              label: "email".tr(),
            ),
            WTextField(
              prefixIcon: _buildTextFieldIcon(
                AppIcons.phone,
              ),
              suffixIcon:
                  _buildTextFieldIcon(AppIcons.check, color: AppColors.green),
              controller: _fullNameController,
              label: "phone_number".tr(),
            ),
            WTextField(
              prefixIcon: _buildTextFieldIcon(
                AppIcons.location,
              ),
              controller: _fullNameController,
              label: "address".tr(),
            ),
            WTextField(
              prefixIcon: _buildTextFieldIcon(
                AppIcons.calendar,
              ),
              controller: _fullNameController,
              label: "birth_date".tr(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldIcon(String path,
          {Color color = AppColors.subTextColor}) =>
      SvgPicture.asset(
        path,
        colorFilter: ColorFilter.mode(
          color,
          BlendMode.srcIn,
        ),
        fit: BoxFit.none,
      );
}
