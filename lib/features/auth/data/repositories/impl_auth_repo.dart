import 'package:dio/dio.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/error/error_response.dart';
import 'package:math_app/core/error/exception_handler.dart';
import 'package:math_app/core/resources/app_keys.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/auth/data/data_sources/auth_service.dart';
import 'package:math_app/features/auth/data/models/user.dart';
import 'package:math_app/features/auth/domain/entities/login_request.dart';
import 'package:math_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/login_response.dart';

class ImplAuthRepo implements AuthRepo {
  final AuthService authService;

  ImplAuthRepo({required this.authService});

  @override
  Future<DataState<LoginResponse>> login(
      {required LoginRequest loginRequest}) async {
    try {
      final result = await authService.login(loginRequest);

      if (result.response.statusCode == 200) {
        final data = result.data;

        final prefs = await SharedPreferences.getInstance();

        prefs.setString(AppKeys.token, data.authorization.token);

        locator<Dio>().options.headers['Authorization'] =
            'Bearer ${data.authorization.token}';

        return DataSuccess(data: result.data);
      } else {
        return DataError(ErrorResponse(status: result.response.statusCode!,message: result.response.statusMessage));
      }
    } catch (e) {
      return DataException.getError(e);
    }
  }

  @override
  Future<DataState<String?>> logout() async {
    try {
      final result = await authService.logout();

      if (result.response.statusCode == 200) {
        return DataSuccess(data: result.data.data.toString());
      } else {
        return DataError(ErrorResponse(status: result.response.statusCode!,message: result.response.statusMessage));
      }
    } catch (e) {
      return DataException.getError(e);
    }
  }

  @override
  Future<DataState<User?>> getMe() async {
    try {
      final result = await authService.getMe();

      if (result.response.statusCode == 200) {
        return DataSuccess(data: result.data);
      } else {
        return DataError(ErrorResponse(status: result.response.statusCode!,message: result.response.statusMessage));
      }
    } catch (e) {
      return DataException.getError(e);
    }
  }
}
