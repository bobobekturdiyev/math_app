import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math_app/features/auth/domain/entities/register_request.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../../../core/resources/state_status.dart';
import '../../../../../core/util/validator.dart';
import '../../../domain/repositories/auth_repo.dart';

part 'register_screen_event.dart';

part 'register_screen_state.dart';

class RegisterScreenBloc
    extends Bloc<RegisterScreenEvent, RegisterScreenState> {
  final AuthRepo authRepo;
  String token = "";

  final Map<String, dynamic> user = {
    "name": "",
    "lastname": "",
    "phone": "",
    "email": "",
    "password": "",
  };
  String value = '';

  RegisterScreenBloc({required this.authRepo})
      : super(const RegisterScreenInitial()) {
    on<Back>((event, emit) {
      emit(const RegisterScreenInitial(status: StateStatus.normal));
    });

    on<ConfirmEvent>(_confirmEvent);
    // on<ResendCode>(_resendCode);
    on<VerifyCode>(_verifyCode);
  }

  Future<FutureOr<void>> _confirmEvent(
      ConfirmEvent event, Emitter<RegisterScreenState> emit) async {
    bool hasError = false;

    Map<String, String?> auth = {
      'value': null,
      'name': null,
      'surname': null,
      'password': null,
      'confirmPassword': null,
      'error': null,
    };

    emit(RegisterScreenInitial(
      status: StateStatus.loaded,
      errorData: auth,
    ));

    if (!Validator.validateName(event.name)) {
      hasError = true;
      auth['name'] = 'email_not_valid'.tr();
    }
    if (!Validator.validateName(event.surname)) {
      hasError = true;
      auth['surname'] = 'email_not_valid'.tr();
    }
    if (!Validator.validatePhone(event.value)) {
      hasError = true;
      auth['value'] = 'email_not_valid'.tr();
    }
    if (!Validator.validatePassword(event.password)) {
      hasError = true;
      auth['password'] = 'password_not_valid'.tr();
    }
    if (!hasError) {
      value = event.value;

      emit(const RegisterScreenInitial(
        status: StateStatus.loading,
      ));
      final response = await authRepo.register(
          registerRequest: RegisterRequest(
              name: event.name,
              surname: event.surname,
              value: event.value.replaceAll("+", ''),
              password: event.password));
      if (response is DataSuccess) {
        emit(const VerificationState());
      } else {
        auth['error'] = response.errorMessage ?? "something_went_wrong".tr();
        emit(RegisterScreenInitial(
          status: StateStatus.error,
          errorData: auth,
        ));
      }
    }
    if (hasError) {
      emit(RegisterScreenInitial(
        status: StateStatus.error,
        errorData: auth,
      ));
    }
  }

  // FutureOr<void> _resendCode(
  //     ResendCode event, Emitter<RegisterScreenState> emit) async {
  //   emit(const VerificationState(status: StateStatus.loading));
  //
  //   final response =DataSuccess(data: 'data');
  //   // await authRepo.step1(
  //   //   request: Step1Request(
  //   //     loginValue: user['email'],
  //   //     loginType: 'EMAIL',
  //   //   ),
  //   // );
  //
  //   if (response is DataSuccess) {
  //     token = response.data ?? "";
  //
  //     emit(const VerificationState(status: StateStatus.success));
  //   } else if (response is DataError) {
  //     emit(VerificationState(
  //       status: StateStatus.error,
  //       error: response.errorResponse?.message ?? response.errorResponse?.error,
  //     ));
  //   }
  // }

  FutureOr<void> _verifyCode(
      VerifyCode event, Emitter<RegisterScreenState> emit) async {
    emit(const VerificationState(status: StateStatus.loading));

    final response = await authRepo.verifyCode(
        value: value.replaceAll("+", ''), code: event.code);

    if (response is DataSuccess) {
      emit(const VerificationState(status: StateStatus.success));

      if (response.data!) {}
    } else {
      emit(
        VerificationState(
          status: StateStatus.error,
          error: "error",
        ),
      );
    }
  }
}
