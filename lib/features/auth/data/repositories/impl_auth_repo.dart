import 'package:dio/dio.dart';
import 'package:math_app/features/auth/data/models/login_dto.dart';
import 'package:math_app/features/auth/domain/entities/forgot_req/forgot_req1.dart';
import 'package:math_app/features/auth/domain/entities/forgot_req/forgot_req2.dart';
import 'package:math_app/features/auth/domain/entities/forgot_req/forgot_request.dart';
import 'package:math_app/features/auth/domain/entities/login_request.dart';
import 'package:math_app/features/auth/domain/entities/register_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/di/locator.dart';
import '../../../../core/error/exception_handler.dart';
import '../../../../core/resources/app_keys.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/repositories/auth_repo.dart';
import '../data_sources/auth_service.dart';
import '../models/register_dto.dart';

class ImplAuthRepo extends AuthRepo {
  late SharedPreferences preferences;
  AuthService authService;

  ImplAuthRepo({
    required this.authService,
  }) {
    initialize();
  }

  void initialize() async {
    preferences = await SharedPreferences.getInstance();
  }
  //
  // @override
  // Future<DataState> step1({required RegisterRequest request}) async {
  //   try {
  //     final response = await authService.step1Request(registerRequest: request);
  //
  //     return DataSuccess(data: response.data.data);
  //   } catch (e) {
  //     return _getError(e as DioException);
  //   }
  // }

  @override
  Future<DataState> verifyCode({
    required String value,
    required String code,

  }) async {
    try {
      final response = await authService.verifyCode(reqBody: {
        "verify_code":int.parse(code),
        "value":value
      }



      );
      final String token = response.data.data?.token as String;
      locator<Dio>().options.headers['Authorization'] = 'Bearer $token';
      preferences.setString(AppKeys.token, token);

      return DataSuccess(data: response.data.data);
    } catch (e) {
      return _getError(e as DioException);
    }
  }

  @override
  Future<DataState<RegisterDto>> register({required RegisterRequest registerRequest}) async {
    try {
      final response = await authService.register(
   registerRequest: registerRequest,
      );




      return  DataSuccess<RegisterDto>(data: response.data);
    } catch (e) {
      print(e);
      return _getError<RegisterDto>(e);
    }
  }

  _getError<T>(dynamic exception) => DataException.getError<T>(exception);

  @override
  Future<DataState<LoginDto>> login({required LoginRequest loginRequest}) async {
    final response=await authService.login(loginRequest: loginRequest);

    try{
      if(response.data.data!=null) {
        saveToken(response.data.data!.authorization.token);
      }
      return DataSuccess<LoginDto>(data: response.data);

    }catch(e){
      print(e);
      return _getError<LoginDto>(e);

    }

  }

  @override
  Future<DataState<LoginDto>> resetPassword({required ForgotReq forgotReq})async {
      try{
        final response=await authService.resetPassword(forgotReq: forgotReq);
       if(response.data.data!=null) {
         saveToken(response.data.data!.authorization.token);
      }

      return DataSuccess<LoginDto>(data: response.data);
      }catch(e){
        return _getError<LoginDto>(e);

      }
  }

  saveToken( String token){
    locator<Dio>().options.headers['Authorization'] = 'Bearer $token';
    preferences.setString(AppKeys.token, token);

  }

  @override
  Future<DataState<LoginDto>> revokePassword({required  ForgotOneReq forgotOneReq})async {
    try{
      final response=await authService.revokePassword(forgotOneReq: forgotOneReq);
      return DataSuccess<LoginDto>(data: response.data);
    }catch(e){
      return _getError<LoginDto>(e);


    }
  }

  @override
  Future<DataState<LoginDto>> checkVerifyCode({required ForgotTwoReq forgotTwoReq})async {
      try{
        final response=await authService.checkVerifyPassword(forgotTwoReq: forgotTwoReq);
        return DataSuccess<LoginDto>(data: response.data);

      }catch(e){
        return _getError<LoginDto>(e);
      }
  }


}
