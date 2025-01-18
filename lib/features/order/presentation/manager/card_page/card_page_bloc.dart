import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/order/domain/entities/send_order_request.dart';
import 'package:math_app/features/order/domain/repositories/order_repo.dart';

part 'card_page_event.dart';
part 'card_page_state.dart';

class CardPageBloc extends Bloc<CardPageEvent, CardPageState> {
  final OrderRepo orderRepo = locator<OrderRepo>();
  XFile? image;

  CardPageBloc() : super(CardPageInitial()) {
    on<LoadCardNumber>((event, emit) async {
      emit(CardPageInitial(isLoading: true));

      final result = await orderRepo.getCardNumber();

      if (result is DataSuccess && result.data != null) {
        emit(CardPageInitial(cardNumber: result.data!.cardNumber));
      } else if (result is DataError) {
        emit(CardPageError(
            message: result.errorMessage ?? "Karta yuklanishida xatolik"));
      }
    });

    on<ChooseImage>((event, emit) async {
      emit(CardPageInitial(isChoosingImage: true));

      final ImagePicker picker = ImagePicker();
      image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        emit(CardPageInitial(imagePath: image!.path));
      } else {
        emit(CardPageInitial());
      }
    });

    on<CardPageSendData>((event, emit) async {
      if (image == null) {
        Map<String, String> errors = {};
        errors['data'] = "Rasm tanlangan emas";
      } else {
        if (image != null) {
          emit(CardPageInitial(isSendingImage: true, imagePath: image!.path));
          final result = await orderRepo.requestOrder(
              sendOrderRequest:
                  SendOrderRequest(orderId: event.orderId, image: image!));

          if (result is DataSuccess && result.data != null) {
            emit(CardPageSuccess());
          } else if (result is DataError) {
            emit(CardPageError(message: result.errorMessage ?? "Xatolik"));
          }
        } else {
          add(ChooseImage());
        }
      }
    });

    add(LoadCardNumber());
  }
}
