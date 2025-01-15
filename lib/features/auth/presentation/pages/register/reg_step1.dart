import 'package:flutter/material.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/state_status.dart';
import '../../../../../core/resources/styles.dart';
import '../../../../../core/widgets/w_button.dart';
import '../../../../../core/widgets/w_form_loader.dart';
import '../../../../../core/widgets/w_textfield.dart';
import '../../manager/register/register_screen_bloc.dart';

class RegStep1 extends StatelessWidget {
  final RegisterScreenInitial state;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController phoneController;
  final FocusNode nameFocusNode;
  final FocusNode surnameFocusNode;
  final FocusNode phoneFocusNode;

  const RegStep1({
    Key? key,
    required this.state,
    required this.firstNameController,
    required this.lastNameController,
    required this.phoneController,
    required this.nameFocusNode,
    required this.surnameFocusNode,
    required this.phoneFocusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String phoneNumber = "";
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "tell_us_about_yourself",
              style: Styles.getTextStyle(fontSize: 18),
            ),
            const SizedBox(height: 24),
            if (
                // state.error != null
                true) ...{
              Text(
                'state.error',
                style: Styles.getTextStyle(
                  fontSize: 14,
                  color: AppColors.danger,
                ),
              ),
            },
            WTextField(
              focusNode: nameFocusNode,
              controller: firstNameController,
              hint: 'firstname',
              keyboardType: TextInputType.text,
              errorText: 'state.errorData?[' 'name' ']',
            ),
            WTextField(
              focusNode: surnameFocusNode,
              controller: lastNameController,
              hint: 'lastname',
              keyboardType: TextInputType.text,
              errorText: "state.errorData?['surname']",
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: state.errorData?['phone'] != null
                      ? AppColors.danger
                      : AppColors.white,
                ),
              ),
              // child: IntlPhoneField(
              //   decoration: InputDecoration(
              //     border: const OutlineInputBorder(
              //       borderSide: BorderSide.none,
              //     ),
              //     contentPadding: const EdgeInsets.only(right: 16),
              //     hintText: 'phone_number',
              //     hintStyle: Styles.getTextStyle(
              //       color: const Color(0xFF666666),
              //       letterSpacing: 1,
              //     ),
              //   ),
              //   dropdownIconPosition: IconPosition.trailing,
              //   dropdownIcon: const DropDownTrailing(),
              //   initialCountryCode: 'NL',
              //   onChanged: (phone) {
              //     phoneNumber = "${phone.countryCode}${phone.number}";
              //   },
              //   focusNode: phoneFocusNode,
              //   pickerDialogStyle: PickerDialogStyle(
              //     backgroundColor: AppColors.white,
              //     countryCodeStyle: Styles.getTextStyle(
              //       color: const Color(0xFF666666),
              //     ),
              //     searchFieldCursorColor: AppColors.black,
              //     countryNameStyle: Styles.getTextStyle(color: AppColors.black),
              //     listTileDivider: const Divider(color: Colors.black12),
              //     listTilePadding: const EdgeInsets.symmetric(horizontal: 8),
              //     searchFieldInputDecoration: InputDecoration(
              //       border: OutlineInputBorder(
              //         borderSide:
              //             const BorderSide(color: AppColors.black, width: 1),
              //         borderRadius: BorderRadius.circular(30),
              //       ),
              //       contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              //       hintText: 'search_country',
              //       hintStyle: Styles.getTextStyle(
              //           color: Colors.black, letterSpacing: 1, fontSize: 12),
              //     ),
              //   ),
              //   keyboardType: const TextInputType.numberWithOptions(),
              //   cursorColor: AppColors.white,
              //   dropdownTextStyle:
              //       Styles.getTextStyle(color: const Color(0xff666666)),
              //   flagsButtonMargin: const EdgeInsets.only(left: 15),
              //   disableLengthCheck: true,
              //   invalidNumberMessage: state.errorData?['phone'],
              //   controller: phoneController,
              //   style: Styles.getTextStyle(),
              //   onSubmitted: (str) {
              //     _callBloc(
              //       context: context,
              //       event: NextStep(
              //         firstName: firstNameController.text.trim(),
              //         lastName: lastNameController.text.trim(),
              //         phoneNumber: phoneNumber,
              //       ),
              //     );
              //   },
              // ),
            ),
            if (
                // state.errorData?['phone'] != null
                true) ...{
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 8),
                child: Text(
                  "state.errorData?['phone']",
                  style:
                      Styles.getTextStyle(fontSize: 8, color: AppColors.danger),
                ),
              ),
            },
            const SizedBox(height: 52),
            SizedBox(
              width: double.infinity,
              child: WButton(
                text: 'next_step',
                onTap: () {
                  // _callBloc(
                  //   context: context,
                  //   event: NextStep(
                  //     firstName: firstNameController.text.trim(),
                  //     lastName: lastNameController.text.trim(),
                  //     phoneNumber: phoneNumber,
                  //   ),
                  // );
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
//   // context.read<RegisterScreenBloc>().add(event);
// }
}
