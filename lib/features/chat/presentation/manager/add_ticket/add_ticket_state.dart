part of 'add_ticket_bloc.dart';

sealed class AddTicketState extends Equatable {
  const AddTicketState();
}

final class AddTicketInitial extends AddTicketState {
  final Map<String, String?>? errorData;

  const AddTicketInitial({
    this.errorData,
  });

  @override
  List<Object> get props => [];
}

final class AddTicketLoading extends AddTicketState {
  @override
  List<Object> get props => [];
}

final class AddTicketError extends AddTicketState {
  final String message;

  const AddTicketError({required this.message});

  @override
  List<Object> get props => [message];
}

final class AddTicketSuccess extends AddTicketState {
  final TicketDto ticketDto;

  const AddTicketSuccess({required this.ticketDto});

  @override
  List<Object> get props => [ticketDto];
}
