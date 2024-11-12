import 'package:dio/dio.dart';

import 'package:math_app/features/profile/domain/entity/card_req/card_pay_req.dart';
import 'package:math_app/features/profile/domain/entity/code_req/code_req.dart';
import 'package:math_app/features/profile/domain/entity/token_req/token_req.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/network/urls.dart';
import '../../model/payme_dto/create_card_dto.dart';
import '../../model/verify_code_dto/verify_code_dto.dart';




part 'payme_service.g.dart';

@RestApi(baseUrl: Urls.payUrl)
abstract class PaymeService {
  factory PaymeService(Dio dio, {String baseUrl}) = _PaymeService;




  @POST("/cards.create")
  Future<HttpResponse<CardCreateDto>> payFromCard({
   @Body() required CardPayReq cardPayReq
  });
  @POST("/cards.get_verify_code")
  Future<HttpResponse<VerifyCodeDto>> sendToken({
   @Body() required TokenReq tokenReq
  }); @POST("/cards.verify")
  Future<HttpResponse<CardCreateDto>> sendCode({
   @Body() required CodeReq codeReq
  });




}
