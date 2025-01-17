part of 'order_bloc.dart';

sealed class OrderState extends Equatable {
  const OrderState();
}

final class OrderInitial extends OrderState {
  @override
  List<Object> get props => [];
}

final class OrderSuccess extends OrderState {
  final OrderDto orderDto;

  const OrderSuccess({
    required this.orderDto,
  });

  @override
  List<Object> get props => [orderDto];
}

final class OrderError extends OrderState {
  final String message;

  const OrderError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
