import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/core/extensions/widget_padding_extention.dart';
import 'package:math_app/core/resources/all_resources.dart';
import 'package:math_app/core/resources/formatters/card_number_input_formatter.dart';
import 'package:math_app/core/resources/formatters/expire_date_input_fotmatter.dart';
import 'package:math_app/core/widgets/countdown_timer_with_provider.dart';
import 'package:math_app/core/widgets/w_alert.dart';
import 'package:math_app/core/widgets/w_button.dart';
import 'package:math_app/core/widgets/w_text_link.dart';
import 'package:math_app/features/order/presentation/manager/payme_page/payme_page_bloc.dart';

class PaymePage extends StatefulWidget {
  final String orderId;

  const PaymePage({
    super.key,
    required this.orderId,
  });

  @override
  State<PaymePage> createState() => _PaymePageState();
}

class _PaymePageState extends State<PaymePage> {
  TextEditingController cardController = TextEditingController();
  TextEditingController expireController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  late PaymePageBloc paymeBloc;

  List<TextEditingController> controllers = [];

  @override
  initState() {
    super.initState();
    controllers = [cardController, expireController, otpController];
    paymeBloc = PaymePageBloc(orderId: widget.orderId);
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }

    super.dispose();
  }

  bool showResend = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: paymeBloc,
      child: BlocListener<PaymePageBloc, PaymePageState>(
        listener: (context, state) {
          if (state is PaymePageReset) {
            cardController.clear();
            expireController.clear();
            otpController.clear();
          }
        },
        child: BlocBuilder<PaymePageBloc, PaymePageState>(
          builder: (context, state) {
            if (state is PaymePageInitial) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (state.errors != null &&
                      state.errors!.containsKey('server')) ...{
                    WAlert(
                      message: state.errors!['server']!,
                      isError: true,
                    ).bottomPadding(16).withSize(width: double.infinity),
                  },
                  Text('Karta raqami').bottomPadding(8),
                  TextField(
                    controller: cardController,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CardNumberInputFormatter(),
                      LengthLimitingTextInputFormatter(19),
                    ],
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'Karta raqamini kiriting',
                      errorText: state.errors != null
                          ? state.errors!['cardNumber']
                          : null,
                    ),
                  ).bottomPadding(16),
                  Text('Amal qilish muddati').bottomPadding(8),
                  TextField(
                    controller: expireController,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                      ExpiryDateInputFormatter(),
                    ],
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'MM/YY',
                      errorText: state.errors != null
                          ? state.errors!['expireDate']
                          : null,
                    ),
                  ).bottomPadding(16),
                  SizedBox(
                    width: double.infinity,
                    child: WButton(
                      text: 'Yuborish',
                      showLoader: state.isLoading,
                      onTap: () {
                        paymeBloc.add(
                          SendOtp(
                            cardNumber: cardController.text.trim(),
                            expireDate: expireController.text.trim(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (state is PaymePageSentOtp) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (state.errors != null &&
                      state.errors!.containsKey('server')) ...{
                    WAlert(
                      message: state.errors!['server']!,
                      isError: true,
                    ).bottomPadding(16).withSize(width: double.infinity),
                  },
                  if (state.message != null) ...{
                    Text(state.message!).bottomPadding(12),
                  },
                  Text('Kodni kiriting').bottomPadding(8),
                  TextField(
                    controller: otpController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Kodni kiriting',
                      errorText:
                          state.errors != null ? state.errors!['otp'] : null,
                    ),
                  ).bottomPadding(16),
                  if (!showResend) ...{
                    Wrap(
                      children: [
                        Text(
                          "Qayta kodni yuborishingizga qolgan vaqt: ",
                          style: TextStyle(color: AppColors.grey),
                        ),
                        CountdownTimerWithProvider(
                          onTimerEnd: () {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              setState(() {
                                showResend = true;
                              });
                            });
                          },
                        ),
                      ],
                    ).bottomPadding(16),
                  } else ...{
                    WTextLink(
                      text: "Qayta kod yuborish",
                      onTap: () {
                        otpController.clear();
                        paymeBloc.add(
                          SendOtp(
                            cardNumber: cardController.text.trim(),
                            expireDate: expireController.text.trim(),
                          ),
                        );
                        showResend = false;
                      },
                    ).bottomPadding(16),
                  },
                  SizedBox(
                    width: double.infinity,
                    child: WButton(
                      text: 'Tasdiqlash',
                      showLoader: state.isLoading,
                      onTap: () {
                        paymeBloc
                            .add(VerifyOtp(otp: otpController.text.trim()));
                        FocusScope.of(context).unfocus();
                      },
                    ),
                  ).bottomPadding(24),
                  Center(
                    child: WTextLink(
                      text: 'Boshqa karta kiritasizmi?',
                      onTap: () {
                        paymeBloc.add(Reset());
                      },
                    ),
                  ),
                ],
              );
            } else if (state is PaymePageSuccess) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 100,
                    ),
                  ).bottomPadding(16),
                  Text(
                    "To'lov muvaffaqiyatli amalga oshirildi",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ).bottomPadding(16),
                  WButton(
                    text: "Ortga qaytish",
                    onTap: () {
                      context.router.maybePop();
                    },
                  ),
                ],
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
