part of 'ticket_messages_bloc.dart';

sealed class TicketMessagesState extends Equatable {
  const TicketMessagesState();
}

final class TicketMessagesInitial extends TicketMessagesState {
  @override
  List<Object> get props => [];
}

final class TicketMessagesLoading extends TicketMessagesState {
  @override
  List<Object> get props => [];
}

final class TicketMessagesError extends TicketMessagesState {
  final String message;

  const TicketMessagesError({required this.message});

  @override
  List<Object> get props => [message];
}

final class TicketMessagesLoaded extends TicketMessagesState {
  final List<TicketMessageDto> messages;
  final bool isLoading;

  const TicketMessagesLoaded({
    required this.messages,
    this.isLoading = false,
  });

  @override
  List<Object> get props => [messages, isLoading];
}
