import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/core/widgets/w_button.dart';
import 'package:math_app/core/widgets/w_loader.dart';
import 'package:math_app/features/order/presentation/manager/payment_type/payment_type_bloc.dart';
import 'package:math_app/features/order/presentation/pages/payme_page.dart';

import '../manager/order/order_bloc.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentTypeBloc, PaymentTypeState>(
      builder: (context, state) {
        if (state is PaymentTypeLoading) {
          return WLoader();
        } else if (state is PaymentTypeLoaded) {
          switch (state.paymentType.value) {
            case 'payme':
              return BlocBuilder<OrderBloc, OrderState>(
                builder: (context, state) {
                  if (state is OrderSuccess) {
                    return PaymePage(
                      orderId: state.orderDto.orderId,
                    );
                  }
                  return Text("Buyurtmada xatolik yuz berdi");
                },
              );
            case 'karta':
              return _getCard();
          }
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        );
      },
    );
  }

  _getCard() {
    return Column(
      children: [
        Text('Karta'),
        WButton(
          text: 'To\'lovni amalga oshirish',
          onTap: () {
            // Karta to'lovni amalga oshirish
          },
        ),
      ],
    );
  }
}
