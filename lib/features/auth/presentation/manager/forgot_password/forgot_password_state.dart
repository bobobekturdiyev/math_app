part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();
}

class ForgotPasswordInitial extends ForgotPasswordState {
  final StateStatus status;
  final String? error;

  const ForgotPasswordInitial({
    this.status = StateStatus.normal,
    this.error,
  });

  @override
  List<Object> get props => [status];
}

class Verification extends ForgotPasswordState {
  final String email;
  final StateStatus status;
  final String? error;

  const Verification({
    required this.email,
    this.status = StateStatus.normal,
    this.error,
  });

  @override
  List<Object?> get props => [email, status];
}

class FinalState extends ForgotPasswordState {
  final String? error;
  final StateStatus status;
  final Map<String, String?>? errorData;

  const FinalState({
    this.status = StateStatus.normal,
    this.errorData,
    this.error,
  });

  @override
  List<Object> get props => [status];
}

class Success extends ForgotPasswordState {
  @override
  List<Object> get props => [];
}
