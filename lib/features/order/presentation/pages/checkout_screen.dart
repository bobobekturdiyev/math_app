import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/all_resources.dart';
import 'package:math_app/core/util/helpers.dart';
import 'package:math_app/core/widgets/w_button.dart';
import 'package:math_app/core/widgets/w_loader.dart';
import 'package:math_app/features/order/presentation/manager/order/order_bloc.dart';
import 'package:math_app/features/order/presentation/manager/payment_type/payment_type_bloc.dart';
import 'package:math_app/features/order/presentation/pages/payment_page.dart';
import 'package:provider/provider.dart';

import '../../../../core/state/provider/countdown_provider.dart';

@RoutePage()
class CheckoutScreen extends StatefulWidget {
  final int courseId;
  final VoidCallback onClose;

  const CheckoutScreen(
      {super.key, required this.courseId, required this.onClose});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  OrderBloc orderBloc = OrderBloc();
  PaymentTypeBloc paymentTypeBloc = PaymentTypeBloc();

  @override
  initState() {
    super.initState();
    _loadData();
  }

  _loadData() {
    orderBloc.add(CreateOrder(courseId: widget.courseId));
  }

  _onClose() {
    widget.onClose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderBloc>.value(value: orderBloc),
        BlocProvider<PaymentTypeBloc>.value(value: paymentTypeBloc),
        ChangeNotifierProvider.value(
          value: locator<CountdownTimerProvider>(),
        ),
      ],
      child: PopScope(
        canPop: true,
        onPopInvokedWithResult: (bool didPop, Object? result) async {
          _onClose();
        },
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              if (state is OrderSuccess) {
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      floating: false,
                      pinned: true,
                      backgroundColor: Colors.white,
                      automaticallyImplyLeading: false,
                      scrolledUnderElevation: 0,
                      titleSpacing: 16,
                      title: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.router.maybePop();
                            },
                            child: SvgPicture.asset(AppIcons.arrowLeftBadge),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Buyurtma",
                            style: Styles.getCourseTitleStyle(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          )
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BlocBuilder<PaymentTypeBloc, PaymentTypeState>(
                                  builder: (context, paymentState) {
                                    Widget text = Text(
                                      state.orderDto.model,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w600),
                                    );

                                    if (paymentState is PaymentTypeLoaded) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(child: text),
                                          SizedBox(width: 12),
                                          Image.asset(
                                            AppImages.payme,
                                            width: 70,
                                          )
                                        ],
                                      );
                                    }

                                    return text;
                                  },
                                ),
                                _orderItem(
                                  title: "Buyurtma:",
                                  value: "#${state.orderDto.orderId}",
                                ),
                                _orderItem(
                                  title: "To'lov:",
                                  value:
                                      Helper.priceFormat(state.orderDto.amount),
                                  isColored: true,
                                ),
                                SizedBox(height: 12),
                                Divider(
                                  color: AppColors.grey.withValues(alpha: 0.4),
                                ),
                                SizedBox(height: 12),
                                PaymentPage(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else if (state is OrderError) {
                return Center(
                  child: Column(
                    children: [
                      Text(state.message),
                      WButton(
                        text: 'Retry',
                        onTap: () {
                          _loadData();
                        },
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: WLoader(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  _orderItem({
    required String title,
    required String value,
    bool isColored = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 6),
          Text(
            value,
            style: TextStyle(
              color: isColored ? AppColors.green : AppColors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
