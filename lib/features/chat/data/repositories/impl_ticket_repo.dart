import 'package:math_app/core/error/exception_handler.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/chat/data/data_source/ticket/ticket_service.dart';
import 'package:math_app/features/chat/data/models/ticket/ticket_dto.dart';
import 'package:math_app/features/chat/data/models/ticket/ticket_message.dart';
import 'package:math_app/features/chat/domain/repositories/ticket_repo.dart';

import '../../domain/entity/add_ticket/add_ticket_request.dart';
import '../../domain/entity/send_ticket_message_request/send_ticket_message_request.dart';

class ImplTicketRepo extends TicketRepo {
  final TicketService ticketService;

  ImplTicketRepo({
    required this.ticketService,
  });

  @override
  Future<DataState<List<TicketDto>>> getTickets() async {
    try {
      final response = await ticketService.getTickets();
      return DataSuccess<List<TicketDto>>(data: response.data);
    } catch (e) {
      return DataException.getError<List<TicketDto>>(e);
    }
  }

  @override
  Future<DataState<TicketDto>> addTicket(
      {required AddTicketRequest addTicketRequest}) async {
    try {
      final response =
          await ticketService.addTicket(addTicketRequest: addTicketRequest);
      return DataSuccess<TicketDto>(data: response.data);
    } catch (e) {
      return DataException.getError<TicketDto>(e);
    }
  }

  @override
  Future<DataState<List<TicketMessageDto>>> getTicketMessages(
      {required int ticketId}) async {
    try {
      final response =
          await ticketService.getTicketMessages(ticketId: ticketId);
      return DataSuccess<List<TicketMessageDto>>(data: response.data);
    } catch (e) {
      return DataException.getError<List<TicketMessageDto>>(e);
    }
  }

  @override
  Future<DataState<TicketMessageDto>> sendNewMessage({
    required SendTicketMessageRequest sendTicketMessageRequest,
  }) async {
    try {
      final response = await ticketService.sendMessage(
          sendTicketMessageRequest: sendTicketMessageRequest);
      return DataSuccess<TicketMessageDto>(data: response.data);
    } catch (e) {
      return DataException.getError<TicketMessageDto>(e);
    }
  }
}
