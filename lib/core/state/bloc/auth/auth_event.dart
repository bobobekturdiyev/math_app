part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AuthLoggedIn extends AuthEvent {
  final User user;

  const AuthLoggedIn({required this.user});

  @override
  List<Object?> get props => [user];
}

class CheckToken extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class GetMeEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class Logout extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class AssignUser extends AuthEvent {
  final User user;

  const AssignUser({
    required this.user,
  });

  @override
  List<Object?> get props => [user];
}
