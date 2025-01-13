import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/chat/data/models/ticket/ticket_message.dart';
import 'package:math_app/features/chat/domain/entity/send_ticket_message_request/send_ticket_message_request.dart';
import 'package:math_app/features/chat/domain/repositories/ticket_repo.dart';

part 'ticket_messages_event.dart';
part 'ticket_messages_state.dart';

class TicketMessagesBloc
    extends Bloc<TicketMessagesEvent, TicketMessagesState> {
  TicketRepo ticketRepo = locator<TicketRepo>();
  List<TicketMessageDto> messages = [];
  int ticketId = 0;

  TicketMessagesBloc() : super(TicketMessagesInitial()) {
    on<LoadTicketMessages>((event, emit) async {
      ticketId = event.ticketId;
      emit(TicketMessagesLoading());

      final result =
          await ticketRepo.getTicketMessages(ticketId: event.ticketId);

      if (result is DataSuccess) {
        messages = result.data ?? [];
        emit(TicketMessagesLoaded(messages: result.data ?? []));
      } else {
        emit(TicketMessagesError(
            message: result.errorMessage ?? "Xabarlarni yuklashda xatolik"));
      }
    });

    on<SendNewMessage>((event, emit) async {
      emit(
        TicketMessagesLoaded(
          messages: messages,
          isLoading: true,
        ),
      );

      final result = await ticketRepo.sendNewMessage(
        sendTicketMessageRequest: SendTicketMessageRequest(
          ticketId: ticketId,
          body: event.body,
        ),
      );

      if (result is DataSuccess && result.data != null) {
        final message = result.data!;

        messages.add(message);
        emit(TicketMessagesLoaded(messages: messages, isLoading: false));
      } else {
        emit(TicketMessagesError(
            message: result.errorMessage ?? "Xabarlarni yuklashda xatolik"));
      }
    });
  }
}
