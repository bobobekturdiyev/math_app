part of 'ticket_messages_bloc.dart';

sealed class TicketMessagesEvent extends Equatable {
  const TicketMessagesEvent();
}

class LoadTicketMessages extends TicketMessagesEvent {
  final int ticketId;

  const LoadTicketMessages({
    required this.ticketId,
  });

  @override
  List<Object?> get props => [ticketId];
}

class SendNewMessage extends TicketMessagesEvent {
  final String body;

  const SendNewMessage({
    required this.body,
  });

  @override
  List<Object?> get props => [body];
}
