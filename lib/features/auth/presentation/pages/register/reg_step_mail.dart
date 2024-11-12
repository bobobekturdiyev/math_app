import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/state_status.dart';
import '../../../../../core/resources/styles.dart';
import '../../../../../core/widgets/w_button.dart';
import '../../../../../core/widgets/w_form_loader.dart';
import '../../../../../core/widgets/w_textfield.dart';
import '../../manager/register/register_screen_bloc.dart';

class RegStepMail extends StatelessWidget {
  final ConfirmState state;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;
  final FocusNode confirmPasswordFocusNode;

  const RegStepMail({
    Key? key,
    required this.state,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.emailFocusNode,
    required this.passwordFocusNode,
    required this.confirmPasswordFocusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "lets_create_your_account".tr(),
              style: Styles.getTextStyle(fontSize: 18),
            ),
            const SizedBox(height: 24),
            if (
            state.errorData?['error'] != null
            ) ...{
              Center(
                child: Text(
                  "state.errorData!['error']!,",
                  style: Styles.getTextStyle(
                      fontSize: 14, color: AppColors.danger),
                ),
              ),
            },
            WTextField(
              focusNode: emailFocusNode,
              controller: emailController,
              hint: 'email'.tr(),
              keyboardType: TextInputType.emailAddress,
              errorText: "state.errorData?['email']",
            ),
            WTextField(
              focusNode: passwordFocusNode,
              controller: passwordController,
              hint: 'password'.tr(),
              isObscure: true,
              keyboardType: TextInputType.visiblePassword,
              errorText: "state.errorData?['password']",
            ),
            WTextField(
              focusNode: confirmPasswordFocusNode,
              controller: confirmPasswordController,
              hint: 'confirm_password'.tr(),
              isObscure: true,
              keyboardType: TextInputType.visiblePassword,
              errorText: "state.errorData?['confirmPassword']",
            ),
            const SizedBox(height: 52),
            SizedBox(
              width: double.infinity,
              child: WButton(
                text: 'next_step'.tr(),
                onTap: () {
                  // _callBloc(
                  //     context: context,
                  //     event: ConfirmEvent(
                  //       email: emailController.text.trim(),
                  //       password: passwordController.text.trim(),
                  //       confirmPassword: confirmPasswordController.text.trim(),
                  //     ));
                },
              ),
            ),
          ],
        ),
        if (StateStatus.normal == StateStatus.loading) ...{
          const WFormLoader(),
        }
      ],
    );
  }

  // _callBloc(
  //     {required BuildContext context, required RegisterScreenEvent event}) {
  //   FocusScope.of(context).unfocus();
  //   context.read<RegisterScreenBloc>().add(event);
  // }
}
