import 'package:dio/dio.dart';
import 'package:math_app/features/chat/data/models/ticket/ticket_dto.dart';
import 'package:math_app/features/chat/data/models/ticket/ticket_message.dart';
import 'package:math_app/features/chat/domain/entity/add_ticket/add_ticket_request.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/network/urls.dart';
import '../../../domain/entity/send_ticket_message_request/send_ticket_message_request.dart';

part 'ticket_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class TicketService {
  factory TicketService(Dio dio, {String baseUrl}) = _TicketService;

  @GET("/tickets")
  Future<HttpResponse<List<TicketDto>>> getTickets();

  @GET("/ticket/{id}")
  Future<HttpResponse<List<TicketMessageDto>>> getTicketMessages(
      {@Path('id') required int ticketId});

  @POST("/ticket/create")
  Future<HttpResponse<TicketDto>> addTicket(
      {@Body() required AddTicketRequest addTicketRequest});

  @POST("/ticket/message/create")
  Future<HttpResponse<TicketMessageDto>> sendMessage({
    @Body() required SendTicketMessageRequest sendTicketMessageRequest,
  });
}
