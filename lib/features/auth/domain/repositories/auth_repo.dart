import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/auth/data/models/login_response.dart';
import 'package:math_app/core/shared/data/shared_models/user_model/user.dart';
import 'package:math_app/features/auth/domain/entities/login_request.dart';

abstract class AuthRepo {
  Future<DataState<LoginResponse>> login({
    required LoginRequest loginRequest,
  });

  Future<DataState<User?>> getMe();

  Future<DataState<String?>> logout();
}
