part of 'payme_page_bloc.dart';

sealed class PaymePageEvent extends Equatable {
  const PaymePageEvent();
}

class SendOtp extends PaymePageEvent {
  final String cardNumber;
  final String expireDate;

  const SendOtp({required this.cardNumber, required this.expireDate});

  @override
  List<Object> get props => [cardNumber, expireDate];
}

class VerifyOtp extends PaymePageEvent {
  final String otp;

  const VerifyOtp({
    required this.otp,
  });

  @override
  List<Object> get props => [otp];
}

class Reset extends PaymePageEvent {
  @override
  List<Object> get props => [];
}
