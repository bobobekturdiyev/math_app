part of 'card_page_bloc.dart';

sealed class CardPageEvent extends Equatable {
  const CardPageEvent();
}

class LoadCardNumber extends CardPageEvent {
  @override
  List<Object> get props => [];
}

class ChooseImage extends CardPageEvent {
  @override
  List<Object> get props => [];
}

class CardPageSendData extends CardPageEvent {
  final String orderId;

  const CardPageSendData({
    required this.orderId,
  });

  @override
  List<Object> get props => [orderId];
}
