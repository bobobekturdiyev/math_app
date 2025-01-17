part of 'payme_page_bloc.dart';

sealed class PaymePageState extends Equatable {
  const PaymePageState();
}

final class PaymePageInitial extends PaymePageState {
  final bool isLoading;
  final Map<String, String>? errors;

  const PaymePageInitial({this.isLoading = false, this.errors});

  @override
  List<Object> get props => [isLoading];
}

final class PaymePageLoading extends PaymePageState {
  @override
  List<Object> get props => [];
}

final class PaymePageReset extends PaymePageState {
  @override
  List<Object> get props => [];
}

final class PaymePageSentOtp extends PaymePageState {
  final String? message;
  final bool isLoading;
  final Map<String, String>? errors;

  const PaymePageSentOtp({
    this.message,
    this.isLoading = false,
    this.errors,
  });

  @override
  List<Object> get props => [isLoading];
}

final class PaymePageSuccess extends PaymePageState {
  final String message;

  const PaymePageSuccess({required this.message});

  @override
  List<Object> get props => [message];
}
