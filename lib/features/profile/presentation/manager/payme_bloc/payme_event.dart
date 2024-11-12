part of 'payme_bloc.dart';

@immutable
abstract class PaymeEvent extends Equatable {
  const PaymeEvent();
}

class CardVerification extends PaymeEvent{
  final String cardNumber;
  final String expire;

  const CardVerification({required this.cardNumber, required this.expire});

  @override
  List<Object?> get props => [cardNumber, expire];
}

class SendToken extends PaymeEvent{
  final String token;

  const SendToken({required this.token});
  @override
  List<Object?> get props => [token];
}
class VerifyCode extends PaymeEvent{

  final String code;

  const VerifyCode({required this.code});

  @override
  List<Object?> get props => [code];
}

class PayBalance extends PaymeEvent{
  final int id;
  const PayBalance({required this.id});
  @override
  List<Object?> get props => [id];
}
