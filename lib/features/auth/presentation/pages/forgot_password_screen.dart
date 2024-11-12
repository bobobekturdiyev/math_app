import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
import '../manager/forgot_password/forgot_password_bloc.dart';
import '../widgets/w_auth_holder.dart';

@RoutePage()
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with AppDimension {
  TextEditingController emailController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  List<TextEditingController> controllers = [];

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode codeFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  @override
  void initState() {
    controllers = [
      emailController,
      codeController,
      passwordController,
      confirmPasswordController,
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordBloc(authRepo: context.read()),
      child: Unfocus(
        child: Container(
          color: AppColors.backgroundColor,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: AppColors.backgroundColor,
              body: SingleChildScrollView(
                child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                  builder: (context, state) {
                    return WAuthHolder(
                      step: state,
                      isForgot: true,
                      isLogin: false,
                      windowHeight: windowHeight-scaleHeight(28),
                      scaleFactor: scalingFactor(),
                      formElements: [


                        BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
                          listener: (context, state) {
                            if (state is ForgotPasswordInitial &&
                                state.status == StateStatus.error) {
                              setFocus(emailFocusNode);
                            }
                            if (state is Verification &&
                                state.status == StateStatus.error) {
                              setFocus(codeFocusNode);
                            }

                            if (state is Verification &&
                                state.status == StateStatus.normal) {
                              codeController.text = "";
                            }
                            if (state is Success) {
                              context.router.replaceNamed(RoutePath.login);
                            }

                            if (state is FinalState &&
                                state.status == StateStatus.error) {
                              if (state.errorData?['password'] != null) {
                                setFocus(passwordFocusNode);
                              } else if (state.errorData?['confirm_password'] !=
                                  null) {
                                setFocus(confirmPasswordFocusNode);
                              }
                            }
                          },
                          child: BlocBuilder<ForgotPasswordBloc,
                              ForgotPasswordState>(
                            builder: (context, state) {
                              if (state is ForgotPasswordInitial) {
                                return Stack(
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "reset_password".tr(),
                                          style: Styles.getTextStyle(fontSize: scaleSize(22),fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "forgot_sub".tr(),
                                          style: Styles.getTextStyle(color: AppColors.subTextColor),
                                        ),
                                        // Otp(),

                                        WTextField(
                                          controller: emailController,
                                          label: 'email'.tr(),
                                          hint: 'example@gmail.com',
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          errorText: state.error,
                                          focusNode: emailFocusNode,
                                          onSubmitted: (String? str) {
                                            _callBloc(
                                              context: context,
                                              event: GoVerification(
                                                email: emailController.text,
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    if (state ==
                                        StateStatus.loading) ...{
                                      const WFormLoader(),
                                    },
                                    // Align(
                                    //     alignment: Alignment.bottomLeft,
                                    //     child:Wrap(
                                    //       children: [
                                    //         Text("isAvailable_account".tr(),style: Styles.getTextStyle(color: AppColors.subTextColor),),
                                    //         const SizedBox(width: 8,),
                                    //         WTextLink(
                                    //           text: "login".tr(),
                                    //           onTap: () {
                                    //             context.router.replaceNamed(RoutePath.register);
                                    //           },
                                    //         ),
                                    //       ],
                                    //     )
                                    // ),
                                    // Align(
                                    //     alignment: Alignment.bottomLeft,
                                    //     child:Wrap(
                                    //       children: [
                                    //         Text("isAvailable_account".tr(),style: Styles.getTextStyle(color: AppColors.subTextColor),),
                                    //         const SizedBox(width: 8,),
                                    //         WTextLink(
                                    //           text: "login".tr(),
                                    //           onTap: () {
                                    //             context.router.replaceNamed(RoutePath.register);
                                    //           },
                                    //         ),
                                    //       ],
                                    //     )
                                    // ),
                                  ],
                                );
                              } else if (state is Verification) {
                                return Stack(
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "input_code".tr(),
                                          style: Styles.getTextStyle(fontSize: scaleSize(22),fontWeight: FontWeight.w500),
                                        ),
                                        // Text(
                                        //   "forgot_sub".tr(),
                                        //   style: Styles.getTextStyle(color: AppColors.subTextColor),
                                        // ),
                                        WTextField(
                                          label: "getVerify_code".tr(),
                                          focusNode: codeFocusNode,
                                          controller: codeController,
                                          hint: 'verify_code'.tr(),
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          maxLength: 6,
                                          textStyle: Styles.getTextStyle(
                                            letterSpacing: 12,
                                          ),
                                          errorText: state.error,
                                          onSubmitted: (str) {
                                            _callBloc(
                                              context: context,
                                              event: GoFinalStateEvent(
                                                code:
                                                    codeController.text.trim(),
                                              ),
                                            );
                                          },
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [

                                            const SizedBox(width: 8),
                                            WTextLink(
                                              text: "resend".tr(),
                                              fontWeight: FontWeight.w500,
                                              onTap: () {
                                                _callBloc(
                                                  context: context,
                                                  event: const ResendCode(),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: scaleHeight(16))
                                      ],
                                    ),
                                    if (StateStatus.normal ==
                                        StateStatus.loading) ...{
                                      const WFormLoader(),
                                    },
                                  ],
                                );
                              } else if (state is FinalState) {
                                return Stack(
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "new_password".tr(),
                                          style: Styles.getTextStyle(fontSize: scaleSize(22),fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(height: 5,),
                                        WTextField(
                                          focusNode: passwordFocusNode,
                                          controller: passwordController,
                                          label: 'input_password'.tr(),
                                          hint: 'input_password'.tr(),
                                          isObscure: true,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          errorText:null
                                              // "state.errorData?['password']",
                                        ),
                                        WTextField(
                                          focusNode: confirmPasswordFocusNode,
                                          controller: confirmPasswordController,
                                          label: 'repeat_password'.tr(),
                                          hint: 'repeat_password'.tr(),
                                          isObscure: true,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          errorText:null
                                              // "state.errorData?['confirm_password']",
                                        ),
                                      ],
                                    ),
                                    if (StateStatus.normal ==
                                        StateStatus.loading) ...{
                                      const WFormLoader(),
                                    },
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
                        BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                          builder: (context, state) {
                            if (state is ForgotPasswordInitial) {
                              return SizedBox(
                                width: double.infinity,
                                child: WButton(
                                  showLoader:
                                      state.status == StateStatus.loading,
                                  text: 'send'.tr(),
                                  onTap: () {
                                    _callBloc(
                                      context: context,
                                      event: GoVerification(
                                        email: emailController.text,
                                      ),
                                    );
                                  },
                                ),
                              );
                            } else if (state is Verification) {
                              return SizedBox(
                                width: double.infinity,
                                child: WButton(

                                      // state.status == StateStatus.loading,
                                  text: 'get_code'.tr(),
                                  onTap: () {
                                    _callBloc(
                                      context: context,
                                      event: GoFinalStateEvent(
                                        code: codeController.text.trim(),
                                      ),
                                    );
                                  },
                                ),
                              );
                            } else if (state is FinalState) {
                              return SizedBox(
                                width: double.infinity,
                                child: WButton(
                                  // showLoader:
                                  //     state.status == StateStatus.loading,
                                  text: 'send'.tr(),
                                  onTap: () {
                                    _callBloc(
                                      context: context,
                                      event: ResetPasswordEvent(
                                        password: passwordController.text,
                                        confirmPassword:
                                            confirmPasswordController.text,
                                      ),
                                    );
                                  },
                                ),
                              );
                            }
                            return const SizedBox();
                          },
                        ),
                        SizedBox(height: scaleSize(24)),



                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _callBloc(
      {required BuildContext context, required ForgotPasswordEvent event}) {
    FocusScope.of(context).unfocus();
    context.read<ForgotPasswordBloc>().add(event);
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
