import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/chat/data/models/ticket/ticket_dto.dart';
import 'package:math_app/features/chat/data/models/ticket/ticket_message.dart';
import 'package:math_app/features/chat/domain/entity/add_ticket/add_ticket_request.dart';

import '../entity/send_ticket_message_request/send_ticket_message_request.dart';

abstract class TicketRepo {
  Future<DataState<List<TicketDto>>> getTickets();

  Future<DataState<List<TicketMessageDto>>> getTicketMessages(
      {required int ticketId});

  Future<DataState<TicketMessageDto>> sendNewMessage({
    required SendTicketMessageRequest sendTicketMessageRequest,
  });

  Future<DataState<TicketDto>> addTicket(
      {required AddTicketRequest addTicketRequest});
}
