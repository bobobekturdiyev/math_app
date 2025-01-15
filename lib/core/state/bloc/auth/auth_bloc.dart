import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/app_keys.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/auth/data/models/user.dart';
import 'package:math_app/features/auth/domain/entities/check_token_request.dart';
import 'package:math_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  bool loggedIn = false;
  final AuthRepo authRepo = locator<AuthRepo>();
  User? user;

  AuthBloc() : super(AuthInitial(isLoggedIn: false)) {
    on<AuthLoggedIn>((event, emit) {
      emit(AuthInitial(isLoggedIn: loggedIn));
      loggedIn = true;

      emit(LoggedIn(isLoggedIn: true));
    });

    on<CheckToken>((event, emit) async {
      emit(AuthInitial(isLoggedIn: this.loggedIn));
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(AppKeys.token);

      bool loggedIn = false;
      if (token != null) {
        // check with server if not valid clear shared preferences
        final result = await authRepo.checkToken(
            checkTokenRequest: CheckTokenRequest(token: token));

        loggedIn = result is DataSuccess;
        if (result is DataSuccess && result.data != null) {
          user = result.data!.user;
          this.loggedIn = loggedIn;
        }
      }

      emit(LoggedIn(isLoggedIn: loggedIn));
    });

    on<Logout>((event, emit) async {
      emit(LoggingOut());

      final result = await authRepo.logout();

      if (result is DataSuccess) {
        final prefs = await SharedPreferences.getInstance();
        loggedIn = false;
        prefs.remove(AppKeys.token);
        locator<Dio>().options.headers['Authorization'] = null;
        loggedIn = false;
        emit(LoggedOut());
      } else {
        emit(
          LoggedIn(
            isLoggedIn: loggedIn,
            message: result.errorMessage,
            isError: true,
          ),
        );
      }
    });
  }
}
