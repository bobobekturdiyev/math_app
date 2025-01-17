import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/order/data/models/payment_type_dto.dart';
import 'package:math_app/features/order/domain/repositories/order_repo.dart';

part 'payment_type_event.dart';
part 'payment_type_state.dart';

// Payment UI ni boshqarish uchun kerak
class PaymentTypeBloc extends Bloc<PaymentTypeEvent, PaymentTypeState> {
  final OrderRepo orderRepo = locator<OrderRepo>();

  PaymentTypeBloc() : super(PaymentTypeInitial()) {
    on<LoadPaymentTypes>((event, emit) async {
      emit(PaymentTypeLoading());

      final result = await orderRepo.getPaymentTypes();

      if (result is DataSuccess && result.data != null) {
        emit(PaymentTypeLoaded(result.data!));
      } else {
        emit(PaymentTypeError(
            message: result.errorMessage ?? 'An error occurred'));
      }
    });

    add(LoadPaymentTypes());
  }
}
