import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/app_toast.dart';
import 'package:math_app/core/resources/state_status.dart';
import 'package:math_app/core/widgets/w_bottomsheet.dart';
import 'package:math_app/core/widgets/w_button.dart';
import 'package:math_app/core/widgets/w_textfield.dart';
import 'package:math_app/features/profile/presentation/manager/user_bloc/user_bloc.dart';
import 'package:math_app/features/profile/presentation/widgets/w_drop.dart';

import '../../../../config/routes/route_path.dart';
import '../../../../core/di/locator.dart';
import '../../../../core/resources/app_icons.dart';
import '../../../../core/resources/styles.dart';
import '../manager/payme_bloc/payme_bloc.dart';
import '../manager/plan_bloc/plan_bloc.dart';
import '../widgets/w_plan_item.dart';

@RoutePage()
class PlanScreen extends StatefulWidget {
  const PlanScreen({Key? key}) : super(key: key);

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  final TextEditingController cardController = TextEditingController();
  final TextEditingController expireController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlanBloc(profileRepo: context.read()),
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
                      context.router.pop();
                    },
                    child: SvgPicture.asset(AppIcons.arrowLeft),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Tariflar",
                    style: Styles.getTextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
          ),
          body: BlocListener<PlanBloc, PlanState>(
            listener: (context, state) {
              if (state is PlanUnauthorized) {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        title: const Text("Diqqat"),
                        content: Text("Hisobingoza kiring"),
                        actions: [
                          WButton(
                              text: "Bekor qilish",
                              onTap: () {
                                Navigator.pop(context);
                              }),
                          WButton(
                              text: "Kirish",
                              onTap: () {
                                context.router.replaceNamed(RoutePath.login);
                              })
                        ],
                      );
                    });
              }
            },
            child: BlocBuilder<PlanBloc, PlanState>(
              builder: (context, state) {
                if (state is PlanLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is PlanLoaded) {
                  return SingleChildScrollView(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      WPlanItem(
                        onTap: () {
                          showToPay(price: state.plans[0].price, id: state.plans[0].id);
                        },
                        plan: state.plans[0],
                        colors: const [
                          Color(0xFF9766FF),
                          Color(0xFFD83EF1),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      WPlanItem(
                        onTap: () {
                          showToPay(price: state.plans[1].price, id: state.plans[1].id);
                        },
                        plan: state.plans[1],
                        isYear: true,
                        colors: const [
                          Color(0xFFFF6666),
                          Color(0xFFF1D43E),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ));
                } else if (state is PlanError) {
                  return const Center(
                    child: Text("Error"),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          )),
    );
  }

  showToPay({required double price,required int id}) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: locator<GlobalKey<ScaffoldState>>().currentContext!,
        builder: (ctx) {
          return BlocProvider(
            create: (context) => PaymeBloc(profileRepo: context.read()),
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: WBottomSheet(
                title: 'Tarif narxi:${price} so\'m',
                body: Column(
                  children: [
                    BlocListener<PaymeBloc, PaymeState>(
                      listener: (context, state) {
                        if (state is PaySuccess) {
                          AppToast.show(context: context, message: "To'landi");
                          context.router.pop();
                        }
                      },
                      child: BlocBuilder<PaymeBloc, PaymeState>(
                        builder: (context, state) {
                          if (state is PaymeInitial) {
                            return WDrop(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "Ism-Familya: ${ctx.read<UserBloc>().allInfoDto.student.name}${ctx.read<UserBloc>().allInfoDto.student.surname}",
                                      style: Styles.getTextStyle(),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "ID: ${ctx.read<UserBloc>().allInfoDto.student}",
                                      style: Styles.getTextStyle(),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "Hisobingizdagi mablag': ${ctx.read<UserBloc>().allInfoDto.student.balance}",
                                      style: Styles.getTextStyle(),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    if (state.errorPay != null) ...{
                                      Text(
                                        state.errorPay!,
                                        style: Styles.getTextStyle(
                                            color: AppColors.danger),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                    },
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        WButton(
                                          text: "Hisobni to'ldirish",
                                          onTap: () {},
                                          color: AppColors.green,
                                        ),
                                        WButton(
                                          text: "To'lash",
                                          onTap: () {
                                            context
                                                .read<PaymeBloc>()
                                                .add(PayBalance(id: id));
                                          },
                                          showLoader: state.status ==
                                              StateStatus.loading,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    if (state.status == StateStatus.error &&
                                        state.error != null) ...{
                                      Text(
                                        state.error!,
                                        style: Styles.getTextStyle(
                                            color: AppColors.danger),
                                      )
                                    },
                                    WTextField(
                                      controller: cardController,
                                      label: "Karta raqami",
                                      hint: "karta raqamingizni kiriting",
                                      keyboardType: TextInputType.number,
                                      maxLength: 16,
                                      errorText: state.errorData?['card'],
                                    ),
                                    WTextField(
                                      controller: expireController,
                                      label: "Amal qilish muddati",
                                      hint: 'oy/yil',
                                      maxLength: 4,
                                      errorText: state.errorData?['expire'],
                                      keyboardType: TextInputType.number,
                                    ),
                                    WButton(
                                        text: "send".tr(),
                                        onTap: () {
                                          context.read<PaymeBloc>().add(
                                              CardVerification(
                                                  cardNumber:
                                                      cardController.text,
                                                  expire:
                                                      expireController.text));
                                        })
                                  ],
                                )
                              ],
                            );
                          } else if (state is CardVerifyCode) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                WTextField(
                                  label: "getVerify_code".tr(),
                                  // focusNode: codeFocusNode,
                                  controller: codeController,
                                  hint: 'verify_code'.tr(),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  maxLength: 6,
                                  textStyle: Styles.getTextStyle(
                                    letterSpacing: 12,
                                  ),
                                  errorText: state.error,
                                  onSubmitted: (str) {},
                                ),
                                WButton(
                                    text: "send".tr(),
                                    onTap: () {
                                      context.read<PaymeBloc>().add(VerifyCode(
                                          code: codeController.text));
                                    })
                              ],
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
