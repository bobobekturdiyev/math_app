import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:math_app/config/routes/router.gr.dart';
import 'package:math_app/features/main/presentation/manager/app_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_dimension.dart';
import '../../../../core/resources/styles.dart';
import '../../../../core/widgets/unfocus.dart';
import '../../../../core/widgets/w_button.dart';
import '../manager/login/login_screen_bloc.dart';
import '../widgets/w_auth_holder.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

enum LoginWithState { defaultLogin, telegram }

class _LoginScreenState extends State<LoginScreen> with AppDimension {
  TextEditingController controller = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginWithState loginWithState = LoginWithState.telegram;
  FocusNode focusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  List<TextEditingController> controllers = [];

  @override
  void initState() {
    controllers = [
      controller,
      codeController,
      passwordController,
    ];
    super.initState();
  }

  LoginScreenBloc loginScreenBloc = LoginScreenBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginScreenBloc>.value(
      value: loginScreenBloc,
      child: Unfocus(
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: BlocBuilder<LoginScreenBloc, LoginScreenState>(
            builder: (context, state) {
              return BlocListener<LoginScreenBloc, LoginScreenState>(
                listener: (context, state) {
                  if (state is Success) {
                    context.router.replaceAll([SplashRoute()]);
                  }
                },
                child: SingleChildScrollView(
                  child: KeyboardVisibilityBuilder(
                      builder: (context, isKeyboardVisible) {
                    return ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: isKeyboardVisible
                            ? MediaQuery.sizeOf(context).height / 2
                            : MediaQuery.sizeOf(context).height -
                                100, // Account for keyboard height
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: WAuthHolder(
                          scaleFactor: scalingFactor(),
                          formElements: [
                            Text(
                              "Tizimga kirish",
                              style: Styles.getTextStyle(
                                  fontSize: scaleSize(22),
                                  fontWeight: FontWeight.w500),
                            ),
                            BlocBuilder<AppBloc, AppState>(
                              builder: (context, state) {
                                if (state is AppLoaded) {
                                  final bot = state.appDto.bot;

                                  return Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "@${bot.username}",
                                          style: TextStyle(
                                            color: AppColors.primaryColor,
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 14,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () async {
                                              final url =
                                                  'https://t.me/${bot.username}';
                                              await _launchUrl(url);
                                            },
                                        ),
                                        TextSpan(
                                          text:
                                              " telegram botimiz orqali 1 daqiqalik kod olib, quyida yozing: ",
                                          style: TextStyle(
                                            color: AppColors.grey,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }

                                return SizedBox();
                              },
                            ),
                            SizedBox(
                              height: scaleHeight(12),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  controller: codeController,
                                  decoration: InputDecoration(
                                      hintText: 'Kodni kiriting',
                                      counterText: "",
                                      errorText: state is LoginScreenInitial
                                          ? (state.errorData?['value'])
                                          : null),
                                  cursorColor: AppColors.primaryColor,
                                  maxLength: 6,
                                  keyboardType: TextInputType.number,
                                ),
                                if (state is LoginError) ...{
                                  SizedBox(height: 8),
                                  Text(
                                    state.message,
                                    style: Styles.getTextStyle(
                                      fontSize: 14,
                                      color: AppColors.danger,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                },
                                SizedBox(
                                  height: scaleSize(8),
                                ),
                              ],
                            )
                          ],
                          footerElements: [
                            SizedBox(
                              width: double.infinity,
                              child: WButton(
                                text: 'Tizimga kirish',
                                showLoader: state is LoginScreenLoading,
                                onTap: () {
                                  final code = codeController.text.trim();
                                  if (code.isNotEmpty && code != "") {
                                    loginScreenBloc.add(
                                        SendTelegramCredentials(value: code));
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: scaleSize(8)),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void setFocus(FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  @override
  void dispose() {
    for (var i in controllers) {
      i.dispose();
    }
    super.dispose();
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Size get size => MediaQuery.sizeOf(context);
}
