part of 'register_screen_bloc.dart';

abstract class RegisterScreenState extends Equatable {
  const RegisterScreenState();
}

class RegisterScreenInitial extends RegisterScreenState {
  final StateStatus status;
  final Map<String, String?>? errorData;
  final String? error;

  const RegisterScreenInitial({
    this.error,
    this.status = StateStatus.normal,
    this.errorData,
  });
  @override
  List<Object> get props => [status];
}

class ConfirmState extends RegisterScreenState {
  final StateStatus status;
  final Map<String, String?>? errorData;

  const ConfirmState({
    this.status = StateStatus.normal,
    this.errorData,
  });

  @override
  List<Object> get props => [status];
}

class VerificationState extends RegisterScreenState {
  final StateStatus status;
  final String? error;

  const VerificationState({
    this.status = StateStatus.normal,
    this.error,
  });

  @override
  List<Object> get props => [status];
}

class Success extends RegisterScreenState {
  const Success();

  @override
  List<Object> get props => [];
}
