part of 'payment_type_bloc.dart';

sealed class PaymentTypeEvent extends Equatable {
  const PaymentTypeEvent();
}

class LoadPaymentTypes extends PaymentTypeEvent {
  @override
  List<Object> get props => [];
}
