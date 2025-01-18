import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/core/extensions/widget_padding_extention.dart';
import 'package:math_app/core/resources/all_resources.dart';
import 'package:math_app/core/util/snackbar_helper.dart';
import 'package:math_app/core/widgets/w_alert.dart';
import 'package:math_app/core/widgets/w_button.dart';
import 'package:math_app/core/widgets/w_loader.dart';
import 'package:math_app/features/order/data/models/order_dto.dart';
import 'package:math_app/features/order/presentation/manager/card_page/card_page_bloc.dart';

import '../manager/order/order_bloc.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  CardPageBloc cardPageBloc = CardPageBloc();

  String? cardNumber;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cardPageBloc,
      child: BlocListener<CardPageBloc, CardPageState>(
        listener: (context, state) {
          if (state is CardPageInitial && state.cardNumber != null) {
            cardNumber = state.cardNumber;
          }
        },
        child: BlocBuilder<OrderBloc, OrderState>(
          builder: (context, orderState) {
            if (orderState is OrderSuccess) {
              final order = orderState.orderDto;

              print(order);
              switch (order.status) {
                case 'requested':
                  return _requestedView();
                case 'completed':
                  return _completedView();
                default:
                  return _defaultView(order);
              }
            } else {
              return Text("Buyurtma yuklanmagan");
            }
          },
        ),
      ),
    );
  }

  _requestedView() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              Icons.refresh,
              color: AppColors.yellowDark,
              size: 100,
            ),
          ).bottomPadding(16),
          Text(
            "So'rovingiz tekshiruv jarayonida",
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

  _completedView() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              Icons.check_circle,
              color: AppColors.yellowDark,
              size: 100,
            ),
          ).bottomPadding(16),
          Text(
            "To'lov tasdiqlangan. Darslarni mening kursim bo'limida ko'ring",
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

  _defaultView(OrderDto order) => BlocBuilder<CardPageBloc, CardPageState>(
        builder: (context, state) {
          if (state is CardPageInitial) {
            if (state.isLoading) {
              return WLoader();
            }

            if (cardNumber != null) {
              return Column(
                children: [
                  Text('1. Quyidagi karta raqamiga to\'lovni amalga oshiring:')
                      .bottomPadding(16),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(
                          color: AppColors.grey.withValues(alpha: 0.5)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            cardNumber!,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: cardNumber!));
                            SnackbarHelper.showSuccess(
                                context: context,
                                text: 'Karta raqami nusxalandi');
                          },
                          icon: Icon(
                            Icons.copy,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ).bottomPadding(20),
                  Text("2. To'lov skrinshotini oling, quyida tanlang va bizga yuboring:")
                      .bottomPadding(16),
                  GestureDetector(
                    onTap: () {
                      cardPageBloc.add(ChooseImage());
                    },
                    child: state.imagePath != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.file(
                              File(state.imagePath!),
                              fit: BoxFit.fitWidth,
                              width: 200,
                            ),
                          )
                        : Container(
                            alignment: Alignment.center,
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.grey.withValues(alpha: 0.3)),
                            child: Icon(
                              Icons.camera_alt,
                              size: 50,
                              color: AppColors.grey,
                            ),
                          ),
                  ).bottomPadding(20),
                  if (state.errors != null && state.errors!.isNotEmpty)
                    WAlert(message: state.errors!.values.first)
                        .bottomPadding(16),
                  WButton(
                    text: 'Yuborish',
                    showLoader: state.isSendingImage,
                    onTap: () {
                      cardPageBloc.add(
                        CardPageSendData(
                          orderId: order.orderId,
                        ),
                      );
                    },
                  ).withSize(width: double.infinity),
                ],
              );
            } else {
              return Text(
                  'Karta raqami topilmadi, iltimos biz bilan bog\'laning va biz muammoni hal qilamiz');
            }
          } else if (state is CardPageSuccess) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Icon(
                    Icons.check_circle,
                    color: AppColors.green,
                    size: 100,
                  ),
                ).bottomPadding(16),
                Text(
                  "So'rovingiz yuborildi, tez orada tekshiramiz",
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
          } else if (state is CardPageError) {
            return Text(state.message);
          }
          return SizedBox();
        },
      );
}
