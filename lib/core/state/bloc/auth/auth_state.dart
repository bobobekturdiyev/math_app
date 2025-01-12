part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  final bool isLoggedIn;

  const AuthState({required this.isLoggedIn});
}

class AuthInitial extends AuthState {
  AuthInitial({required super.isLoggedIn});

  @override
  List<Object> get props => [];
}

class LoggedIn extends AuthState {
  final String? message;
  final bool isError;

  LoggedIn({
    required super.isLoggedIn,
    this.message,
    this.isError = false,
  });

  @override
  List<Object> get props => [isError, super.isLoggedIn];
}
