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

class Success extends LoginScreenState {
  @override
  List<Object> get props => [];
}
