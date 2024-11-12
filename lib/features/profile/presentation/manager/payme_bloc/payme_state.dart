part of 'payme_bloc.dart';

@immutable
abstract class PaymeState extends Equatable {
  const PaymeState();
}

class PaymeInitial extends PaymeState {
  final StateStatus status;
  final Map<String, String?>? errorData;
  final String? error;
  final String? errorPay;

  const PaymeInitial(
      { this.error,  this.status=StateStatus.normal,  this.errorData,this.errorPay,});
  @override
  List<Object?> get props => [status, errorData,error,errorPay];
}
class CardVerifyCode extends PaymeState {
  final StateStatus status;
  final String? error;
  final String? phone;

  const CardVerifyCode(
      { this.error,  this.status=StateStatus.normal,  this.phone,  });
  @override
  List<Object?> get props => [status,error,phone];
}

class PaySuccess extends PaymeState {

  @override
  List<Object?> get props => [];
}
