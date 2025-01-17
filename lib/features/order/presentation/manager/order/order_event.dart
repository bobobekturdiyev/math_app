part of 'order_bloc.dart';

sealed class OrderEvent extends Equatable {
  const OrderEvent();
}

class CreateOrder extends OrderEvent {
  final int courseId;

  const CreateOrder({
    required this.courseId,
  });

  @override
  List<Object> get props => [courseId];
}
