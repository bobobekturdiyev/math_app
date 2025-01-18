part of 'card_page_bloc.dart';

sealed class CardPageState extends Equatable {
  const CardPageState();
}

final class CardPageInitial extends CardPageState {
  final bool isLoading;
  final bool isChoosingImage;
  final bool isSendingImage;
  final String? cardNumber;
  final String? imagePath;
  final Map<String, String>? errors;

  const CardPageInitial({
    this.isLoading = false,
    this.isChoosingImage = false,
    this.isSendingImage = false,
    this.cardNumber,
    this.imagePath,
    this.errors,
  });

  @override
  List<Object> get props => [isLoading, isChoosingImage, isSendingImage];
}

final class CardPageLoading extends CardPageState {
  @override
  List<Object> get props => [];
}

final class CardPageSuccess extends CardPageState {
  @override
  List<Object> get props => [];
}

final class CardPageError extends CardPageState {
  final String message;

  const CardPageError({required this.message});

  @override
  List<Object> get props => [message];
}
