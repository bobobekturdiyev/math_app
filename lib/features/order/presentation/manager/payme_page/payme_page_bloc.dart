import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/core/state/provider/countdown_provider.dart';
import 'package:math_app/core/util/validator.dart';
import 'package:math_app/features/order/data/models/send_otp_dto.dart';
import 'package:math_app/features/order/domain/entities/send_otp_request.dart';
import 'package:math_app/features/order/domain/entities/verify_otp_request.dart';
import 'package:math_app/features/order/domain/repositories/order_repo.dart';

part 'payme_page_event.dart';
part 'payme_page_state.dart';

class PaymePageBloc extends Bloc<PaymePageEvent, PaymePageState> {
  OrderRepo orderRepo = locator<OrderRepo>();
  SendOtpDto? _sendOtpDto;
  final String orderId;

  PaymePageBloc({required this.orderId}) : super(PaymePageInitial()) {
    on<SendOtp>((event, emit) async {
      emit(PaymePageInitial(isLoading: true));

      Map<String, String> errors = {};
      bool hasError = false;

      if (!Validator.validateCardNumber(event.cardNumber)) {
        errors['cardNumber'] = "To'g'ri karta raqamini kiriting";
        hasError = true;
      }

      String expire = event.expireDate;
      expire = expire.replaceAll('/', '');

      if (!Validator.validateExpiryDate(expire)) {
        errors['expireDate'] = "To'g'ri muddatni kiriting";
        hasError = true;
      }

      if (hasError) {
        emit(PaymePageInitial(errors: errors));
      } else {
        final cardNumber = event.cardNumber;
        final expireDate = expire;

        final result = await orderRepo.sendOtp(
          sendOtpRequest:
              SendOtpRequest(cardNumber: cardNumber, expireDate: expireDate),
        );

        if (result is DataSuccess && result.data != null) {
          _sendOtpDto = result.data!;
          locator<CountdownTimerProvider>().startTimer();
          emit(PaymePageSentOtp(message: result.data!.message));
        } else {
          errors['server'] = result.errorMessage ?? "Xatolik yuz berdi";
          emit(PaymePageInitial(errors: errors));
        }
      }
    });
    on<Reset>((event, emit) async {
      emit(PaymePageReset());
      emit(PaymePageInitial());
    });
    on<VerifyOtp>((event, emit) async {
      emit(PaymePageSentOtp(isLoading: true));

      Map<String, String> errors = {};
      bool hasError = false;

      if (!Validator.validateCode(event.otp)) {
        errors['otp'] = "To'g'ri kodni kiriting";
        hasError = true;
      }

      if (hasError) {
        emit(PaymePageSentOtp(errors: errors));
      } else {
        final otp = event.otp;

        final result = await orderRepo.verifyOtp(
          verifyOtpRequest: VerifyOtpRequest(
              orderId: orderId, token: _sendOtpDto!.token, otp: otp),
        );

        if (result is DataSuccess && result.data != null) {
          locator<CountdownTimerProvider>().cancelTimer();
          emit(PaymePageSuccess(message: result.data!.message));
        } else {
          errors['server'] = result.errorMessage ?? "Xatolik yuz berdi";
          emit(PaymePageSentOtp(errors: errors));
        }
      }
    });
  }
}
