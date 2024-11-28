part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class GetPassword extends LoginEvent {
  final bool isResent;

  const GetPassword({
    this.isResent = false,
  });

  @override
  List<Object?> get props => [isResent];
}

class SendData extends LoginEvent {
  final String code;

  const SendData({
    required this.code,
  });

  @override
  List<Object?> get props => [code];
}
