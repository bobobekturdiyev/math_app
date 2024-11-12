import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


import '../../../../../core/resources/state_status.dart';
import '../../../../../core/resources/styles.dart';
import '../../../../../core/widgets/w_button.dart';
import '../../../../../core/widgets/w_form_loader.dart';
import '../../../../../core/widgets/w_text_link.dart';
import '../../../../../core/widgets/w_textfield.dart';
import '../../manager/register/register_screen_bloc.dart';

class RegStepVerification extends StatelessWidget {
  final VerificationState state;
  final TextEditingController codeController;
  final FocusNode codeFocusNode;
  final String email;

  const RegStepVerification({
    Key? key,
    required this.state,
    required this.codeController,
    required this.codeFocusNode,
    required this.email,
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
            Text.rich(
              TextSpan(
                text: "we_sent_email".tr(),
                style: Styles.getTextStyle(
                  fontSize: 15,
                ),
                children: [
                  TextSpan(
                    text: email,
                    style: Styles.getTextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            const SizedBox(height: 32),
            WTextField(
              focusNode: codeFocusNode,
              controller: codeController,
              hint: 'enter_the_code'.tr(),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 6,
              textStyle: Styles.getTextStyle(
                letterSpacing: 12,
              ),
              errorText: 'state.error',
              onSubmitted: (str) {
                // _callBloc(
                //     context: context,
                //     event: VerifyCode(code: codeController.text.trim()));
              },
            ),
            const SizedBox(height: 19),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "didnot_receive_the_code".tr(),
                  style: Styles.getTextStyle(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 8),
                WTextLink(
                  text: "resend".tr(),
                  fontWeight: FontWeight.w500,
                  onTap: () {
                    // _callBloc(context: context, event: ResendCode());
                  },
                ),
              ],
            ),
            const SizedBox(height: 44),
            SizedBox(
              width: double.infinity,
              child: WButton(
                text: 'confirm'.tr(),
                onTap: () {
                  // _callBloc(
                  //     context: context,
                  //     event: VerifyCode(code: codeController.text.trim()));
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
