part of 'add_ticket_bloc.dart';

sealed class AddTicketEvent extends Equatable {
  const AddTicketEvent();
}

class SendTicketEvent extends AddTicketEvent {
  final String title;
  final String body;

  const SendTicketEvent({
    required this.title,
    required this.body,
  });

  @override
  List<Object?> get props => [title, body];
}
