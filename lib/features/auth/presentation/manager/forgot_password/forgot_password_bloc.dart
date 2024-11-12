import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math_app/features/auth/domain/entities/forgot_req/forgot_req1.dart';
import 'package:math_app/features/auth/domain/entities/forgot_req/forgot_req2.dart';
import 'package:math_app/features/auth/domain/entities/forgot_req/forgot_request.dart';


import '../../../../../core/resources/data_state.dart';
import '../../../../../core/resources/state_status.dart';
import '../../../../../core/util/validator.dart';
import '../../../domain/repositories/auth_repo.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthRepo authRepo;
  late String email;

  ForgotPasswordBloc({required this.authRepo})
      : super(const ForgotPasswordInitial()) {
    on<GoVerification>((event, emit) async {
      String error = "";
      if (!Validator.validatePhone(event.email)) {
        error = "email_not_valid".tr();

        emit(ForgotPasswordInitial(
          status: StateStatus.error,
          error: error,
        ));
      } else {
        emit(const ForgotPasswordInitial(status: StateStatus.loading));
        email = event.email;

        final result = 
        await authRepo.revokePassword(forgotOneReq: ForgotOneReq(value:int.parse(event.email)));

        if (result is DataSuccess  ) {
          emit(Verification(email: event.email));
        } else {
          emit(ForgotPasswordInitial(
            status: StateStatus.error,
            error: result.errorResponse?.message ?? result.errorResponse?.errors?[0],
          ));
        }
      }
    });

    String token = "";

    on<GoFinalStateEvent>((event, emit) async {
      emit(Verification(email: email, status: StateStatus.loading));
      final result =
          await authRepo.checkVerifyCode(forgotTwoReq: ForgotTwoReq(value: int.parse(email), code: int.parse(event.code)));

      if (result is DataSuccess&&result.data?.code==200) {
        emit(const FinalState());

      } else {
        emit(
          Verification(
            email: email,
            status: StateStatus.error,
            error: result.data?.message??  'incorrect_code'.tr(),
          ),
        );

      }
    });

    on<ResendCode>((event, emit) async {
      emit(Verification(email: email, status: StateStatus.normal));
      emit(Verification(email: email, status: StateStatus.loading));
      final result =DataSuccess(data: []);
      // await authRepo.passwordResetByEmail(email: email);
      if (result.data != null) {
        emit(Verification(email: email));
      } else {
        emit(ForgotPasswordInitial(
          status: StateStatus.error,
          error: result.errorResponse?.message ?? result.errorResponse?.errors?[0],
        ));
      }
    });

    on<ResetPasswordEvent>((event, emit) async {
      final Map<String, String?> errors = {
        'password': null,
        'confirm_password': null,
      };

      bool hasError = false;
      if (!Validator.validatePassword(event.password)) {
        hasError = true;
        errors['password'] = 'password_not_valid'.tr();
      }

      if (!Validator.validatePassword(event.confirmPassword)) {
        hasError = true;
        errors['confirm_password'] = 'password_not_valid'.tr();
      }

      if (event.password != event.confirmPassword) {
        hasError = true;
        errors['password'] = 'passwords_not_same'.tr();
        errors['confirm_password'] = 'passwords_not_same'.tr();
      }

      if (hasError) {
        emit(FinalState(status: StateStatus.error, errorData: errors));
      } else {
        emit(const FinalState(status: StateStatus.loading));
        final result = await authRepo.resetPassword(
            forgotReq: ForgotReq(
                value: int.parse(email),
                password: event.password,
                passwordConfirm: event.confirmPassword));

        if (result is DataSuccess && result.data == null) {
          emit(Success());
        } else {
          emit(FinalState(
            status: StateStatus.error,
            error: result.errorResponse?.message ?? result.errorResponse?.errors?[0],
          ));
        }
      }
    });
  }
}
