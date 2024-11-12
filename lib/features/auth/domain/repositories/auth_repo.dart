

import 'package:math_app/features/auth/data/models/login_dto.dart';
import 'package:math_app/features/auth/data/models/register_dto.dart';
import 'package:math_app/features/auth/domain/entities/forgot_req/forgot_req1.dart';
import 'package:math_app/features/auth/domain/entities/forgot_req/forgot_req2.dart';
import 'package:math_app/features/auth/domain/entities/login_request.dart';

import '../../../../core/resources/data_state.dart';
import '../entities/forgot_req/forgot_request.dart';
import '../entities/register_request.dart';

abstract class AuthRepo {
  // Future<DataState> step1({required Step1Request request});
  // Future<DataState> verifyCode({
  //   required String loginType,
  //   required String token,
  //   required String key,
  // });

  Future<DataState<RegisterDto>> register({
    required RegisterRequest registerRequest,
  });

  Future<DataState<LoginDto>> login({
    required LoginRequest loginRequest,
  });

  Future<DataState<LoginDto>> resetPassword({
    required ForgotReq forgotReq,
  });
  Future<DataState<LoginDto>> revokePassword({
    required ForgotOneReq forgotOneReq
  });
  Future<DataState> verifyCode({
    required String value,
    required String code
  });

  Future<DataState<LoginDto>> checkVerifyCode({
  required ForgotTwoReq forgotTwoReq
  });

  // Future<DataState> phoneExists({required String phone});
  // Future<DataState> emailExists({required String email});
  //
  // Future<DataState> login({
  //   required String value,
  //   required String password,
  //   required String loginType,
  // });
  //
  // Future<DataState> passwordResetByEmail({
  //   required String email,
  // });
  //
  // Future<DataState> verifyByEmail({
  //   required String email,
  //   required String code,
  // });
  //
  // Future<DataState> resetPassword({
  //   required String password,
  //   required String token,
  //   required String loginType,
  // });
  //
  // Future<DataState> logout();
  //
  // Future<DataState> updateVerifyKey({
  //   required String loginType,
  //   required String value,
  // });
  //
  // Future<DataState> verifyUpdateVerificationKey({
  //   required String loginType,
  //   required String value,
  //   required String key,
  // });
  //
  // Future<DataState> changeMyEmail({
  //   required String value,
  //   required String key,
  // });
  // Future<DataState> changePassword({
  //   required String currentPassword,
  //   required String newPassword,
  // });
}
