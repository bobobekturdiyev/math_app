part of 'payment_type_bloc.dart';

sealed class PaymentTypeState extends Equatable {
  const PaymentTypeState();
}

final class PaymentTypeInitial extends PaymentTypeState {
  @override
  List<Object> get props => [];
}

final class PaymentTypeLoading extends PaymentTypeState {
  @override
  List<Object> get props => [];
}

final class PaymentTypeLoaded extends PaymentTypeState {
  final PaymentTypeDto paymentType;

  const PaymentTypeLoaded(this.paymentType);

  @override
  List<Object> get props => [];
}

final class PaymentTypeError extends PaymentTypeState {
  final String message;

  const PaymentTypeError({required this.message});

  @override
  List<Object> get props => [];
}
