import 'package:dio/dio.dart';
import 'package:math_app/features/order/data/models/card_number_dto.dart';
import 'package:math_app/features/order/data/models/order_dto.dart';
import 'package:math_app/features/order/data/models/payment_type_dto.dart';
import 'package:math_app/features/order/data/models/send_otp_dto.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/urls.dart';
import '../../domain/entities/create_order_request.dart';
import '../../domain/entities/send_otp_request.dart';
import '../../domain/entities/verify_otp_request.dart';
import '../models/verify_otp_dto.dart';

part 'order_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class OrderService {
  factory OrderService(Dio dio, {String baseUrl}) = _OrderService;

  @POST("/order/create")
  Future<HttpResponse<OrderDto>> createOrder({
    @Body() required CreateOrderRequest createOrderRequest,
  });

  @GET("/payment/types")
  Future<HttpResponse<PaymentTypeDto>> getPaymentTypes();

  @GET("/payment/get-card")
  Future<HttpResponse<CardNumberDto>> getCardNumber();

  @POST("/payment/send-otp")
  Future<HttpResponse<SendOtpDto>> sendOtp({
    @Body() required SendOtpRequest sendOtpRequest,
  });

  @POST("/payment/verify-otp")
  Future<HttpResponse<VerifyOtpDto>> verifyOtp({
    @Body() required VerifyOtpRequest verifyOtpRequest,
  });
}
