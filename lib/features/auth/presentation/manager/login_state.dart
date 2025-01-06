part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class ShowCodeState extends LoginState {
  final bool isResent;
  final bool isSending;

  const ShowCodeState({
    this.isResent = false,
    this.isSending = false,
  });

  @override
  List<Object> get props => [isResent, isSending];
}

class SuccessLogin extends LoginState {
  final User user;

  const SuccessLogin({
    required this.user,
  });

  @override
  List<Object> get props => [user];
}

class ErrorLogin extends LoginState {
  final String message;

  const ErrorLogin({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
