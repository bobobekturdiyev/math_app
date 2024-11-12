import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/features/auth/domain/entities/login_request.dart';


import '../../../../../core/resources/data_state.dart';
import '../../../../../core/resources/state_status.dart';
import '../../../../../core/util/validator.dart';
import '../../../domain/repositories/auth_repo.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  final AuthRepo authRepo;

  LoginScreenBloc({required this.authRepo})
      : super(const LoginScreenInitial()) {
    on<LoginScreenEvent>((event, emit) {});
    on<SendCredentials>(_sendCredentials);
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
       auth['value'] = 'phone_or_email_invalid'.tr();
    }

    if (!Validator.validatePassword(event.password)) {
      hasError = true;
      auth['password'] = 'password_not_valid'.tr();
    }

    if (!hasError) {
      emit(const LoginScreenInitial(status: StateStatus.loading));

      final  result = await
      authRepo.login(loginRequest: LoginRequest(value: event.value.replaceAll('+', ''), password: event.password));

     if(result is DataSuccess){
       if (result.data?.code==200) {
         print(" bu if ${result.data?.message}");
         emit(Success());
       } else {
         print(" bu else ${result.data?.message}");

         auth['error'] = result.data?.message;

         hasError = true;
       }
     }else{
       print("object");
       hasError = true;

     }
    }

    if (hasError) {
      emit(LoginScreenInitial(status: StateStatus.error, errorData: auth));
    }
  }
}
