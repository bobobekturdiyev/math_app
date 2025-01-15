import 'package:dio/dio.dart';
import 'package:math_app/core/resources/message_response.dart';
import 'package:math_app/features/auth/data/models/login_dto.dart';
import 'package:math_app/features/auth/domain/entities/check_token_request.dart';
import 'package:math_app/features/auth/domain/entities/forgot_req/forgot_req1.dart';
import 'package:math_app/features/auth/domain/entities/forgot_req/forgot_req2.dart';
import 'package:math_app/features/auth/domain/entities/forgot_req/forgot_request.dart';
import 'package:math_app/features/auth/domain/entities/login_request.dart';
import 'package:math_app/features/auth/domain/entities/login_telegram_request.dart';
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
      final response = await authService.verifyCode(
          reqBody: {"verify_code": int.parse(code), "value": value});
      final String token = response.data.data?.token as String;
      locator<Dio>().options.headers['Authorization'] = 'Bearer $token';
      preferences.setString(AppKeys.token, token);

      return DataSuccess(data: response.data.data);
    } catch (e) {
      return _getError(e as DioException);
    }
  }

  @override
  Future<DataState<RegisterDto>> register(
      {required RegisterRequest registerRequest}) async {
    try {
      final response = await authService.register(
        registerRequest: registerRequest,
      );

      return DataSuccess<RegisterDto>(data: response.data);
    } catch (e) {
      print(e);
      return _getError<RegisterDto>(e);
    }
  }

  _getError<T>(dynamic exception) => DataException.getError<T>(exception);

  //
  // @override
  // Future<DataState<UserDto>> login(
  //     {required LoginRequest loginRequest}) async {
  //   final response = await authService.login(loginRequest: loginRequest);
  //   //
  //   // try {
  //   //   if (response.data.data != null) {
  //   //     saveToken(response.data.data!.authorization.token);
  //   //   }
  //   //   return DataSuccess<UserDto>(data: response.data);
  //   // } catch (e) {
  //   //   print(e);
  //   //   return _getError<UserDto>(e);
  //   // }
  // }

  // @override
  // Future<DataState<UserDto>> resetPassword(
  //     {required ForgotReq forgotReq}) async {
  //   try {
  //     final response = await authService.resetPassword(forgotReq: forgotReq);
  //     if (response.data.data != null) {
  //       saveToken(response.data.data!.authorization.token);
  //     }
  //
  //     return DataSuccess<UserDto>(data: response.data);
  //   } catch (e) {
  //     return _getError<UserDto>(e);
  //   }
  // }

  saveToken(String token) {
    locator<Dio>().options.headers['Authorization'] = 'Bearer $token';
    preferences.setString(AppKeys.token, token);
  }

  @override
  Future<DataState<UserDto>> revokePassword(
      {required ForgotOneReq forgotOneReq}) async {
    try {
      final response =
          await authService.revokePassword(forgotOneReq: forgotOneReq);
      return DataSuccess<UserDto>(data: response.data);
    } catch (e) {
      return _getError<UserDto>(e);
    }
  }

  @override
  Future<DataState<UserDto>> checkVerifyCode(
      {required ForgotTwoReq forgotTwoReq}) async {
    try {
      final response =
          await authService.checkVerifyPassword(forgotTwoReq: forgotTwoReq);
      return DataSuccess<UserDto>(data: response.data);
    } catch (e) {
      return _getError<UserDto>(e);
    }
  }

  @override
  Future<DataState<MessageResponse>> logout() async {
    try {
      final result = await authService.logout();

      return DataSuccess<MessageResponse>(data: result.data);
    } catch (e) {
      return _getError<MessageResponse>(e);
    }
  }

  @override
  Future<DataState<UserDto>> loginWithTelegram(
      {required LoginTelegramRequest loginTelegramRequest}) async {
    try {
      final result = await authService.loginTelegram(
          loginTelegramRequest: loginTelegramRequest);

      if (result.response.statusCode == 200) {
        final data = result.data;

        final prefs = await SharedPreferences.getInstance();

        prefs.setString(AppKeys.token, data.token);
        locator<Dio>().options.headers['Authorization'] =
            'Bearer ${data.token}';

        return DataSuccess<UserDto>(data: result.data);
      } else {
        return DataError<UserDto>(result.response.statusMessage);
      }
    } catch (e) {
      return _getError<UserDto>(e);
    }
  }

  @override
  Future<DataState<UserDto>> checkToken(
      {required CheckTokenRequest checkTokenRequest}) async {
    try {
      final result =
          await authService.checkToken(checkTokenRequest: checkTokenRequest);

      return DataSuccess<UserDto>(data: result.data);
    } catch (e) {
      return _getError<UserDto>(e);
    }
  }

  @override
  Future<DataState<UserDto>> login({required LoginRequest loginRequest}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<DataState<UserDto>> resetPassword({required ForgotReq forgotReq}) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }
}
