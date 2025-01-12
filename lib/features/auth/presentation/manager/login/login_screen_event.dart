part of 'login_screen_bloc.dart';

abstract class LoginScreenEvent extends Equatable {
  const LoginScreenEvent();
}

class SendCredentials extends LoginScreenEvent {
  final String value;
  final String password;

  const SendCredentials({
    required this.value,
    required this.password,
  });

  @override
  List<Object?> get props => [value, password];
}

class SendTelegramCredentials extends LoginScreenEvent {
  final String value;

  const SendTelegramCredentials({
    required this.value,
  });

  @override
  List<Object?> get props => [value];
}
