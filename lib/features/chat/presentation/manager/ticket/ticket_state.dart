part of 'ticket_bloc.dart';

sealed class TicketState extends Equatable {
  const TicketState();
}

final class TicketInitial extends TicketState {
  @override
  List<Object> get props => [];
}

final class TicketLoading extends TicketState {
  @override
  List<Object> get props => [];
}

final class TicketLoaded extends TicketState {
  final List<TicketDto> tickets;

  const TicketLoaded({
    required this.tickets,
  });

  @override
  List<Object> get props => [tickets];
}

final class TicketError extends TicketState {
  final String message;

  const TicketError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
