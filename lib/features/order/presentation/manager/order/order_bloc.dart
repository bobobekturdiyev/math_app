import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/order/data/models/order_dto.dart';
import 'package:math_app/features/order/domain/entities/create_order_request.dart';
import 'package:math_app/features/order/domain/repositories/order_repo.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepo orderRepo = locator<OrderRepo>();

  OrderBloc() : super(OrderInitial()) {
    on<CreateOrder>((event, emit) async {
      final result = await orderRepo.createOrder(
          createOrderRequest: CreateOrderRequest(courseId: event.courseId));

      if (result is DataSuccess && result.data != null) {
        emit(OrderSuccess(orderDto: result.data!));
      } else {
        emit(OrderError(
            message: result.errorMessage ??
                'Buyurtma yaratishda xatolik yuz berdi'));
      }
    });
  }
}
