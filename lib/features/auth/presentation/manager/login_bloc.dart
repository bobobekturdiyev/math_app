import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/core/shared/data/shared_models/user_model/user.dart';
import 'package:math_app/features/auth/domain/entities/login_request.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/repositories/auth_repo.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepo authRepo;

  LoginBloc({
    required this.authRepo,
  }) : super(LoginInitial()) {
    String _token = "";

    on<GetPassword>((event, emit) async {
      emit(LoginInitial());
      final pass = generateAlphanumericString(20);
      _token = pass;
      final _telegramUrl = "https://t.me/testlash1bot?start=student_$pass";

      print(_telegramUrl);
      final uri = Uri.parse(_telegramUrl);

      if (await launchUrl(uri)) {
        emit(ShowCodeState(isResent: event.isResent));
      }
    });

    on<SendData>((event, emit) async {
      emit(ShowCodeState(isSending: true));
      final result = await authRepo.login(
          loginRequest: LoginRequest(code: event.code, token: _token));

      if (result is DataSuccess) {
        emit(SuccessLogin(user: result.data!.user));
      } else {
        // emit(ErrorLogin(message: result.errorMessage ?? "null"));
      }
      emit(ShowCodeState(isSending: false));

      // if (await launchUrl(uri)) {
      //   emit(ShowCodeState(isResent: event.isResent));
      // }
    });
  }

  String generateAlphanumericString(int length) {
    const String chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();

    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(random.nextInt(chars.length))));
  }
}
