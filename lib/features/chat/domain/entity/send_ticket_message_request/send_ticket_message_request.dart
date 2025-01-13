import 'package:json_annotation/json_annotation.dart';

part 'send_ticket_message_request.g.dart';

@JsonSerializable()
class SendTicketMessageRequest {
  final int ticketId;
  final String body;

  const SendTicketMessageRequest({
    required this.ticketId,
    required this.body,
  });

  factory SendTicketMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$SendTicketMessageRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SendTicketMessageRequestToJson(this);
}
