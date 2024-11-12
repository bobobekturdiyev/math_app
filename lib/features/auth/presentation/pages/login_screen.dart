import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restart_app/restart_app.dart';

import '../../../../config/routes/route_path.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_dimension.dart';
import '../../../../core/resources/state_status.dart';
import '../../../../core/resources/styles.dart';
import '../../../../core/widgets/unfocus.dart';
import '../../../../core/widgets/w_button.dart';
import '../../../../core/widgets/w_form_loader.dart';
import '../../../../core/widgets/w_text_link.dart';
import '../../../../core/widgets/w_textfield.dart';
import '../manager/login/login_screen_bloc.dart';
import '../widgets/w_auth_holder.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with AppDimension {
  TextEditingController controller = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode focusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  List<TextEditingController> controllers = [];

  @override
  void initState() {
    controllers = [
      controller,
      passwordController,
    ];
    super.initState();
  }

  late BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginScreenBloc(authRepo: context.read() ),
      child: Unfocus(
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: SingleChildScrollView(
            child: SizedBox(
              height: windowHeight,
              child: WAuthHolder(
                windowHeight: windowHeight,
                scaleFactor: scalingFactor(),
                formElements: [
                  Text(
                    "login".tr(),
                    style: Styles.getTextStyle(fontSize: scaleSize(22),fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "email_password".tr(),
                    style: Styles.getTextStyle(color: AppColors.subTextColor),
                  ),
                  SizedBox(height: scaleHeight(12),),
                  BlocListener<LoginScreenBloc, LoginScreenState>(
                    listener: (context, state) {
                      if (state is LoginScreenInitial &&
                          state.status == StateStatus.error) {
                        if (state.errorData?['value'] != null) {
                          setFocus(focusNode);
                        } else if (state.errorData?['password'] != null) {
                          setFocus(passwordFocusNode);
                        }
                      }

                      if (state is Success) {
                        Restart.restartApp();

                      }
                    },
                    child: BlocBuilder<LoginScreenBloc, LoginScreenState>(
                      builder: (context, state) {
                        ctx = context;
                        if (state is LoginScreenInitial) {
                          return Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (state.errorData != null &&
                                      state.errorData!['error'] != null) ...{
                                    Text(
                                      state.errorData!['error']!,
                                      style: Styles.getTextStyle(
                                        fontSize: 14,
                                        color: AppColors.danger,
                                      ),
                                    ),
                                  },
                                  WTextField(
                                    label: 'email'.tr(),
                                    focusNode: focusNode,
                                    controller: controller,
                                    hint: "example@gmail.com",

                                    keyboardType: TextInputType.emailAddress,
                                    errorText: state.errorData?['value'],
                                  ),
                                  // SizedBox(height: scaleSize(4)),
                                  WTextField(
                                    label: 'password'.tr(),
                                    focusNode: passwordFocusNode,
                                    hint: '*********',
                                    controller: passwordController,
                                    isObscure: true,
                                    keyboardType: TextInputType.visiblePassword,
                                    errorText: state.errorData?['password'],
                                    onSubmitted: (str) {
                                      _callBloc(
                                        context: context,
                                        event: SendCredentials(
                                          value: controller.text,
                                          password: passwordController.text,
                                        ),
                                      );
                                    },
                                  ),

                                  Align(
                                    alignment: Alignment.topRight,
                                    child: WTextLink(
                                      text: "forgot_password".tr(),
                                      onTap: () {
                                        context.router.replaceNamed(RoutePath.forgotPassword);
                                      },
                                    ),
                                  ),
                                  SizedBox(height: scaleSize(8)),
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
                ],
                footerElements: [
                  SizedBox(
                    width: double.infinity,
                    child: WButton(
                      text: 'login'.tr(),
                      onTap: () {
                        _callBloc(
                            context: ctx,
                            event: SendCredentials(
                              value: controller.text,
                              password: passwordController.text,
                            ));
                      },
                    ),
                  ),
                  SizedBox(height: scaleSize(8)),

                  Align(
                    alignment: Alignment.center,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text("Sizda akkount mavjudmi?",style: Styles.getTextStyle(color: AppColors.subTextColor),),
                        const SizedBox(width: 8,),
                        WTextLink(
                          text: "register".tr(),
                          onTap: () {
                            context.router.replaceNamed(RoutePath.register);
                          },
                        ),
                      ],
                    )
                  ),
                  SizedBox(height: scaleSize(28)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _callBloc({required BuildContext context, required LoginScreenEvent event}) {
    FocusScope.of(context).unfocus();
    context.read<LoginScreenBloc>().add(event);
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

  @override
  Size get size => MediaQuery.sizeOf(context);
}
