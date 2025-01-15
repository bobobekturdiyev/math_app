import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/state/bloc/auth/auth_bloc.dart';
import 'package:math_app/features/auth/domain/entities/login_request.dart';
import 'package:math_app/features/auth/domain/entities/login_telegram_request.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../../../core/resources/state_status.dart';
import '../../../../../core/util/validator.dart';
import '../../../domain/repositories/auth_repo.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  final AuthRepo authRepo = locator<AuthRepo>();

  LoginScreenBloc() : super(const LoginScreenInitial()) {
    on<LoginScreenEvent>((event, emit) {});
    on<SendCredentials>(_sendCredentials);
    on<SendTelegramCredentials>(_sendTelegramCredentials);
  }

  Future<FutureOr<void>> _sendCredentials(
      SendCredentials event, Emitter<LoginScreenState> emit) async {
    emit(const LoginScreenInitial());
    final Map<String, String?> auth = {
      'value': null,
      'password': null,
      'error': null,
    };
    bool hasError = false;

    if (!Validator.validatePhone(event.value)) {
      hasError = true;
      auth['value'] = 'phone_or_email_invalid';
    }

    if (!Validator.validatePassword(event.password)) {
      hasError = true;
      auth['password'] = 'password_not_valid';
    }

    if (!hasError) {
      emit(const LoginScreenInitial(status: StateStatus.loading));

      final result = await authRepo.login(
          loginRequest: LoginRequest(
              value: event.value.replaceAll('+', ''),
              password: event.password));

      if (result is DataSuccess) {
        // if (result.data?.code == 200) {
        //   print(" bu if ${result.data?.message}");
        //   emit(Success());
        // } else {
        //   print(" bu else ${result.data?.message}");
        //
        //   auth['error'] = result.data?.message;
        //
        //   hasError = true;
        // }
      } else {
        print("object");
        hasError = true;
      }
    }

    if (hasError) {
      emit(LoginScreenInitial(status: StateStatus.error, errorData: auth));
    }
  }

  Future<FutureOr<void>> _sendTelegramCredentials(
      SendTelegramCredentials event, Emitter<LoginScreenState> emit) async {
    emit(const LoginScreenInitial());
    final Map<String, String?> auth = {
      'value': null,
    };
    bool hasError = false;

    if (!Validator.validateCode(event.value)) {
      hasError = true;
      auth['value'] = 'Kiritilgan kod 6 raqamdan iborat bo\'lishi kerak';
    }

    if (!hasError) {
      emit(LoginScreenLoading());

      final result = await authRepo.loginWithTelegram(
          loginTelegramRequest: LoginTelegramRequest(otp: event.value));

      if (result is DataSuccess && result.data != null) {
        locator<AuthBloc>().add(AuthLoggedIn(user: result.data!.user));
        emit(Success());
      } else {
        emit(LoginError(
            message: result.errorMessage ?? "Kod yuborishdagi xatolik"));
      }
    } else {
      emit(LoginScreenInitial(status: StateStatus.error, errorData: auth));
    }
  }
}
