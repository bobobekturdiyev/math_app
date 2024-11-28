import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:math_app/config/routes/route_path.dart';
import 'package:math_app/config/routes/router.gr.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/resources/app_images.dart';
import 'package:math_app/core/state/bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';

import '../manager/login_bloc.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(authRepo: context.read()),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 340,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                    ),
                    child: SvgPicture.asset(
                      AppIcons.pause,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: BlocListener<LoginBloc, LoginState>(
                            listener: (context, state) {
                              if (state is SuccessLogin) {
                                _showSnackBar(context, "Siz tizimga kirdingiz");
                                context
                                    .read<BottomNavBarBloc>()
                                    .add(OpenPage(path: RoutePath.home));
                                context.router.replaceAll([AppMainRoute()]);
                                // locator<AuthBloc>()
                                //     .add(AuthLoggedIn(user: state.user));
                              }

                              if (state is ErrorLogin) {
                                _showSnackBar(context, state.message);
                              }

                              if (state is ShowCodeState && state.isResent) {
                                _showSnackBar(context, "Kod yuborildi");
                              }
                            },
                            child: BlocBuilder<LoginBloc, LoginState>(
                              builder: (context, state) {
                                print(state);
                                if (state is LoginInitial) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "KIRISH",
                                        style: TextStyle(
                                          fontFamily: 'Bornia',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      SizedBox(height: 28),
                                      Text(
                                        "Tizimga kirish uchun telegram botimiz \norqali parol oling.",
                                        style: TextStyle(
                                          fontFamily: 'Bornia',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      SizedBox(height: 28),
                                      _gradientButton(
                                        onTap: () {
                                          context
                                              .read<LoginBloc>()
                                              .add(GetPassword());
                                        },
                                        showLogo: true,
                                        isDisabled: false,
                                        text: "Parol olish",
                                      ),
                                    ],
                                  );
                                } else if (state is ShowCodeState) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Kodni kiriting",
                                        style: TextStyle(
                                          fontFamily: 'Bornia',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      Text(
                                        "Telegram orqali sizga yuborilgan kodni kiriting",
                                        style: TextStyle(
                                          fontFamily: 'Bornia',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      SizedBox(height: 14),
                                      TextField(
                                        controller: textEditingController,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.zero,
                                          border: _getBorder(),
                                          enabledBorder: _getBorder(),
                                          focusedBorder: _getBorder(),
                                          hintStyle: TextStyle(
                                            color: AppColors.grey,
                                            fontFamily: 'Bornia',
                                            fontSize: 16,
                                          ),
                                          hintText: "Kodni yozing",
                                          counterText: '',
                                        ),
                                        textAlign: TextAlign.center,
                                        maxLength: 6,
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontFamily: 'Bornia',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 28),
                                      _gradientButton(
                                        onTap: () {
                                          if (textEditingController
                                              .text.isNotEmpty) {
                                            context.read<LoginBloc>().add(
                                                SendData(
                                                    code: textEditingController
                                                        .text));
                                          }
                                          textEditingController.text = "";
                                        },
                                        isDisabled: state.isSending,
                                        showLogo: false,
                                        text: "Yuborish",
                                      ),
                                      SizedBox(height: 14),
                                      GestureDetector(
                                        onTap: () {
                                          context
                                              .read<LoginBloc>()
                                              .add(GetPassword(isResent: true));
                                          textEditingController.text = "";
                                        },
                                        child: Center(
                                          child: Text(
                                            "Qayta kod olish",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontFamily: 'Bornia',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                } else {
                                  return SizedBox();
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        SvgPicture.asset(
                          AppIcons.location,
                          width: 120,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                top: 70,
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    AppImages.flutter,
                    width: 215,
                  ),
                ),
              ),
              Positioned(
                top: 48,
                left: 24,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    context.router.maybePop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      AppIcons.arrowLeft,
                      width: 24,
                      colorFilter: ColorFilter.mode(
                        AppColors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showSnackBar(BuildContext context, String text) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            text,
            style: TextStyle(
              fontFamily: 'Bornia',
              fontSize: 16,
            ),
          ),
        ),
      );

  _getBorder() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: AppColors.borderColor,
        ),
      );

  _gradientButton({
    required GestureTapCallback onTap,
    required String text,
    required bool showLogo,
    required bool isDisabled,
  }) =>
      GestureDetector(
        onTap: isDisabled ? null : onTap,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [
                isDisabled ? AppColors.danger : AppColors.green,
                isDisabled ? AppColors.danger : AppColors.blueAccent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (showLogo) ...{
                SvgPicture.asset(
                  AppIcons.dotsBadge,
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: 8),
              },
              Text(
                text.toUpperCase(),
                style: TextStyle(
                  fontFamily: 'Bornia',
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      );
}
