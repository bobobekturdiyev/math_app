import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/core/resources/state_status.dart';
import 'package:restart_app/restart_app.dart';


import '../../../../../config/routes/route_path.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/app_dimension.dart';
import '../../../../../core/resources/styles.dart';
import '../../../../../core/widgets/unfocus.dart';
import '../../../../../core/widgets/w_button.dart';
import '../../../../../core/widgets/w_form_loader.dart';
import '../../../../../core/widgets/w_text_link.dart';
import '../../../../../core/widgets/w_textfield.dart';
import '../../manager/register/register_screen_bloc.dart';
import '../../widgets/w_auth_holder.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with AppDimension{
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController(text: '+998');
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  List<TextEditingController> controllers = [];

  FocusNode nameFocusNode = FocusNode();
  FocusNode surNameFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();
  FocusNode codeFocusNode = FocusNode();

  @override
  void initState() {
    controllers = [
      firstNameController,
      lastNameController,
      phoneController,
      emailController,
      passwordController,
      confirmPasswordController,
      codeController,
    ];
    super.initState();
  }

  FocusNode focusNode = FocusNode();

  late BuildContext ctx;
  void setFocus(FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }


  @override
  Widget build(BuildContext context) {
    return Unfocus(
      child: BlocProvider(
        create: (ctx) => RegisterScreenBloc(authRepo: context.read() ),
        child:   Unfocus(
      child: Scaffold(
      backgroundColor: AppColors.backgroundColor,
        body: Container(
          alignment: Alignment.bottomCenter,
          height: windowHeight,
          child: SingleChildScrollView(
            child:  SizedBox(
              height: windowHeight,
              child: WAuthHolder(
                windowHeight: windowHeight,
                scaleFactor: scalingFactor(),
                formElements: [
                  BlocListener<RegisterScreenBloc, RegisterScreenState>(
                    listener: ( context,state){
                      if(state is VerificationState){
                        if(state.status==StateStatus.success){
                          Restart.restartApp();

                        }
                      }

  },
                    child: BlocBuilder<RegisterScreenBloc, RegisterScreenState>(
                      builder: ( context,state){

                    if(state is RegisterScreenInitial){
                    return  Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "register".tr(),
                                style: Styles.getTextStyle(
                                    fontSize: scaleSize(22),
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "auth_data".tr(),
                                style: Styles.getTextStyle(
                                    color: AppColors.subTextColor),
                              ),
                              SizedBox(
                                height: scaleHeight(12),
                              ),
                              SizedBox(
                                height: scaleHeight(12),
                              ),
                              // if (state.errorData != null &&
                              //     state.errorData!['error'] != null) ...{
                              //   Text(
                              //     state.errorData!['error']!,
                              //     style: Styles.getTextStyle(
                              //       fontSize: 14,
                              //       color: AppColors.danger,
                              //     ),
                              //   ),
                              // },
                              WTextField(
                                label: 'name'.tr(),
                                focusNode: nameFocusNode,
                                controller: firstNameController,
                                hint: "lastname".tr(),
                                keyboardType: TextInputType.emailAddress,
                                errorText: state.errorData?['name'],
                              ),
                              WTextField(
                                label: 'surname'.tr(),
                                focusNode: surNameFocusNode,
                                controller: lastNameController,
                                hint: "surname_hint".tr(),
                                keyboardType: TextInputType.emailAddress,
                                errorText: state.errorData?['surname'],
                              ),
                              WTextField(
                                label: 'email'.tr(),
                                focusNode: emailFocusNode,
                                controller: emailController,
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
                                onSubmitted: (str) {},
                              ),

                              // SizedBox(height: scaleSize(16)),
                            ],
                          ),

                          if(state.status==StateStatus.loading)...{
                              const WFormLoader()
                          }
                        ],
                      );
                    }else if(state is VerificationState){
                      return Column(
                        children: [
                          Text(
                            "activation".tr(),
                            style: Styles.getTextStyle(fontSize: scaleSize(22),fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "send_code".tr(
                                namedArgs: {
                                  "email"  :"sarvarofficial04@gmail",
                                }
                            ),
                            style: Styles.getTextStyle(color: AppColors.subTextColor),
                          ),
                          SizedBox(height: scaleHeight(12),),
                          WTextField(
                            label: 'verify_code'.tr(),
                            focusNode: codeFocusNode,
                            controller: codeController,
                            hint: "verify_code".tr(),
                            keyboardType: TextInputType.emailAddress,
                            errorText: null,
                          ),
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }

                  }),
),

                    ],
                footerElements: [

                  BlocBuilder<RegisterScreenBloc, RegisterScreenState>(
                  builder: ( context,state){
                    if( state is RegisterScreenInitial){
                      return SizedBox(
                        width: double.infinity,
                        child: WButton(
                          text: 'register'.tr(),
                          onTap: () {

                            _callBloc(
                                context: context,
                                    event: ConfirmEvent(
                                        name: firstNameController.text,
                                        surname: lastNameController.text,
                                        value: emailController.text,
                                        password: passwordController.text,
                                  ),
                                );
                              },
                        ),
                      );
                    }
                    else if(state is VerificationState){
                      return    Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: WButton(
                              text: 'confirm'.tr(),
                              onTap: () {

                                _callBloc(
                                    context: context,
                                    event: VerifyCode(code: codeController.text

                                    ));
                              },
                            ),
                          ),
                          SizedBox(height: scaleHeight(8),),
                          SizedBox(
                            width: double.infinity,
                            child: WButton(
                              color:const Color(0xFFD9DDE6),
                              text: '',
                              child: Text(
                                'go_back'.tr(),
                                style: Styles.getTextStyle(color: AppColors.black),

                              ),
                              onTap: () {

                                // _callBloc(
                                //     context: ctx,
                                //     event: SendCredentials(
                                //       value: controller.text,
                                //       password: passwordController.text,
                                //     ));
                              },
                            ),
                          ),
                        ],
                      );
                    }
                    else {
                      return const SizedBox();
                    }

                  }),

                  SizedBox(height: scaleSize(24)),


                  Align(
                      alignment: Alignment.topLeft,
                      child:Wrap(
                        children: [
                           Text("isAvailable_account".tr(),style: Styles.getTextStyle(color: AppColors.subTextColor),),
                          const SizedBox(width: 8,),
                          WTextLink(
                              text: "login".tr(),
                            onTap: () {
                              context.router.replaceNamed(RoutePath.register);
                            },
                          ),
                        ],
                      )
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    ),
      ),
    );
  }

  @override
  void dispose() {
    for (var i in controllers) {
      i.dispose();
    }
    super.dispose();
  }
  _callBloc({required BuildContext context, required RegisterScreenEvent event}) {
    FocusScope.of(context).unfocus();
    context.read<RegisterScreenBloc>().add(event);
  }

  @override
  Size get size => MediaQuery.sizeOf(context);
}
