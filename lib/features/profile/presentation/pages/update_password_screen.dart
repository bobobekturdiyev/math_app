import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/app_toast.dart';
import 'package:math_app/core/resources/state_status.dart';
import 'package:math_app/core/widgets/w_button.dart';
import 'package:math_app/core/widgets/w_textfield.dart';

import '../../../../core/resources/app_icons.dart';
import '../../../../core/resources/styles.dart';
import '../../../../core/widgets/w_form_loader.dart';
import '../manager/update_password/update_password_bloc.dart';

@RoutePage()
class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  bool isLogin = false;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdatePasswordBloc(profileRepo: context.read()),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    context.router.maybePop();
                  },
                  child: SvgPicture.asset(AppIcons.arrowLeft),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "Parolni yangilash",
                  style: Styles.getTextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BlocListener<UpdatePasswordBloc, UpdatePasswordState>(
              listener: (context, state) {
                if (state is UpdatePasswordInitial &&
                    state.status == StateStatus.success) {
                  context.router.maybePop();
                  AppToast.show(
                      context: context, message: "Parol o'zgartirildi");
                }
              },
              child: BlocBuilder<UpdatePasswordBloc, UpdatePasswordState>(
                builder: (context, state) {
                  if (state is UpdatePasswordInitial) {
                    return Stack(
                      children: [
                        Column(
                          children: [
                            // const WLogo(size: 64,),
                            const SizedBox(
                              height: 32,
                            ),
                            Text(
                              "Parolni yangilash",
                              style: Styles.getTextStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 24,
                            ),

                            if (state.error != null) ...{
                              Text(
                                state.error!,
                                style: Styles.getTextStyle(
                                    color: AppColors.danger),
                              )
                            },
                            WTextField(
                              isObscure: true,
                              label: "Yangi parol",
                              hint: 'qwerty',
                              controller: passwordController,
                              errorText: state.errorData?['password'],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            WTextField(
                              isObscure: true,
                              label: "Yangi parolni takrorlang",
                              hint: 'qwerty',
                              errorText: state.errorData?['confirm_password'],
                              controller: confirmPasswordController,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                                width: double.infinity,
                                child: WButton(
                                    borderRadius: 8,
                                    text: "Save changes",
                                    onTap: () {
                                      context.read<UpdatePasswordBloc>().add(
                                          UpdatePassword(
                                              password: passwordController.text,
                                              confirmPassword:
                                                  confirmPasswordController
                                                      .text));
                                    }))
                          ],
                        ),
                        if (state.status == StateStatus.loading) ...{
                          const WFormLoader(),
                        }
                      ],
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
