part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();
}

class GoVerification extends ForgotPasswordEvent {
  final String email;

  const GoVerification({
    required this.email,
  });

  @override
  List<Object?> get props => [email];
}

class GoFinalStateEvent extends ForgotPasswordEvent {
  final String code;

  const GoFinalStateEvent({
    required this.code,
  });

  @override
  List<Object?> get props => [code];
}

class ResendCode extends ForgotPasswordEvent {
  const ResendCode();

  @override
  List<Object?> get props => [];
}

class ResetPasswordEvent extends ForgotPasswordEvent {
  final String password;
  final String confirmPassword;

  const ResetPasswordEvent({
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object?> get props => [password, confirmPassword];
}
