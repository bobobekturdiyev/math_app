import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/order/data/models/order_dto.dart';
import 'package:math_app/features/order/data/models/payment_type_dto.dart';
import 'package:math_app/features/order/data/models/send_otp_dto.dart';
import 'package:math_app/features/order/data/models/verify_otp_dto.dart';
import 'package:math_app/features/order/domain/entities/verify_otp_request.dart';

import '../entities/create_order_request.dart';
import '../entities/send_otp_request.dart';

abstract class OrderRepo {
  Future<DataState<OrderDto>> createOrder({
    required CreateOrderRequest createOrderRequest,
  });

  Future<DataState<PaymentTypeDto>> getPaymentTypes();

  Future<DataState<SendOtpDto>> sendOtp({
    required SendOtpRequest sendOtpRequest,
  });

  Future<DataState<VerifyOtpDto>> verifyOtp({
    required VerifyOtpRequest verifyOtpRequest,
  });
}
