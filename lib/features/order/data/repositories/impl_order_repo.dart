import 'package:math_app/core/error/exception_handler.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/order/data/data_sources/order_service.dart';
import 'package:math_app/features/order/data/models/payment_type_dto.dart';
import 'package:math_app/features/order/data/models/send_otp_dto.dart';
import 'package:math_app/features/order/data/models/verify_otp_dto.dart';
import 'package:math_app/features/order/domain/entities/send_otp_request.dart';
import 'package:math_app/features/order/domain/entities/verify_otp_request.dart';
import 'package:math_app/features/order/domain/repositories/order_repo.dart';

import '../../domain/entities/create_order_request.dart';
import '../models/order_dto.dart';

class ImplOrderRepo extends OrderRepo {
  final OrderService orderService;

  ImplOrderRepo({required this.orderService});

  @override
  Future<DataState<OrderDto>> createOrder(
      {required CreateOrderRequest createOrderRequest}) async {
    try {
      final response = await orderService.createOrder(
          createOrderRequest: createOrderRequest);
      return DataSuccess<OrderDto>(data: response.data);
    } catch (e) {
      return DataException.getError<OrderDto>(e);
    }
  }

  @override
  Future<DataState<PaymentTypeDto>> getPaymentTypes() async {
    try {
      final response = await orderService.getPaymentTypes();
      return DataSuccess<PaymentTypeDto>(data: response.data);
    } catch (e) {
      return DataException.getError<PaymentTypeDto>(e);
    }
  }

  @override
  Future<DataState<SendOtpDto>> sendOtp(
      {required SendOtpRequest sendOtpRequest}) async {
    try {
      final response =
          await orderService.sendOtp(sendOtpRequest: sendOtpRequest);
      return DataSuccess<SendOtpDto>(data: response.data);
    } catch (e) {
      return DataException.getError<SendOtpDto>(e);
    }
  }

  @override
  Future<DataState<VerifyOtpDto>> verifyOtp(
      {required VerifyOtpRequest verifyOtpRequest}) async {
    try {
      final response =
          await orderService.verifyOtp(verifyOtpRequest: verifyOtpRequest);
      return DataSuccess<VerifyOtpDto>(data: response.data);
    } catch (e) {
      return DataException.getError<VerifyOtpDto>(e);
    }
  }
}
