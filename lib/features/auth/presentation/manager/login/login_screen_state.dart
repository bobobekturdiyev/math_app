part of 'login_screen_bloc.dart';

abstract class LoginScreenState extends Equatable {
  const LoginScreenState();
}

class LoginScreenInitial extends LoginScreenState {
  final StateStatus status;
  final Map<String, String?>? errorData;

  const LoginScreenInitial({
    this.status = StateStatus.normal,
    this.errorData,
  });

  @override
  List<Object> get props => [status];
}

class LoginScreenLoading extends LoginScreenState {
  @override
  List<Object> get props => [];
}

class Success extends LoginScreenState {
  @override
  List<Object> get props => [];
}

class LoginError extends LoginScreenState {
  final String message;

  const LoginError({required this.message});

  @override
  List<Object> get props => [message];
}
