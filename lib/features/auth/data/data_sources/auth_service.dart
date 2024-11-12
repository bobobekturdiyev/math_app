import 'package:dio/dio.dart';
import 'package:math_app/features/auth/data/models/login_dto.dart';
import 'package:math_app/features/auth/domain/entities/forgot_req/forgot_req1.dart';
import 'package:math_app/features/auth/domain/entities/forgot_req/forgot_req2.dart';
import 'package:math_app/features/auth/domain/entities/forgot_req/forgot_request.dart';
import 'package:math_app/features/auth/domain/entities/login_request.dart';
import 'package:math_app/features/auth/domain/entities/register_request.dart';
import 'package:retrofit/retrofit.dart';


import '../../../../core/network/urls.dart';
import '../models/register_dto.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST("/register-phone")
  Future<HttpResponse<RegisterDto>> register({
    @Body() required  RegisterRequest registerRequest

  });
  @POST("/login-phone")
  Future<HttpResponse<LoginDto>> login({
    @Body() required  LoginRequest loginRequest

  });

  @POST("/activate-user-phone")
  Future<HttpResponse<RegisterDto>> verifyCode({
   @Body() required Map<String, dynamic> reqBody

  });

  @POST("/revoke-password-phone")
  Future<HttpResponse<LoginDto>> revokePassword({
   @Body() required ForgotOneReq forgotOneReq

  });  
  
  @POST("/check-verify-code-phone")
  Future<HttpResponse<LoginDto>> checkVerifyPassword({
   @Body() required ForgotTwoReq forgotTwoReq

  });

  @POST("/reset-password")
  Future<HttpResponse<LoginDto>> resetPassword({
   @Body() required ForgotReq forgotReq
  });


}
