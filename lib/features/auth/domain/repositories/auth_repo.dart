import 'package:math_app/features/auth/data/models/login_dto.dart';
import 'package:math_app/features/auth/data/models/register_dto.dart';
import 'package:math_app/features/auth/domain/entities/check_token_request.dart';
import 'package:math_app/features/auth/domain/entities/forgot_req/forgot_req1.dart';
import 'package:math_app/features/auth/domain/entities/forgot_req/forgot_req2.dart';
import 'package:math_app/features/auth/domain/entities/login_request.dart';
import 'package:math_app/features/auth/domain/entities/login_telegram_request.dart';

import '../../../../core/resources/data_state.dart';
import '../entities/forgot_req/forgot_request.dart';
import '../entities/register_request.dart';

abstract class AuthRepo {
  Future<DataState<RegisterDto>> register({
    required RegisterRequest registerRequest,
  });

  Future<DataState<UserDto>> login({
    required LoginRequest loginRequest,
  });

  Future<DataState<UserDto>> loginWithTelegram({
    required LoginTelegramRequest loginTelegramRequest,
  });

  Future<DataState<UserDto>> checkToken({
    required CheckTokenRequest checkTokenRequest,
  });

  Future<DataState<UserDto>> resetPassword({
    required ForgotReq forgotReq,
  });

  Future<DataState<UserDto>> revokePassword(
      {required ForgotOneReq forgotOneReq});

  Future<DataState> verifyCode({required String value, required String code});

  Future<DataState<UserDto>> checkVerifyCode(
      {required ForgotTwoReq forgotTwoReq});

  Future<DataState<bool>> logout();
}
