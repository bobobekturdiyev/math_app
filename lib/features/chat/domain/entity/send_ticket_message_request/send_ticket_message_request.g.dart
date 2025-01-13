// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_ticket_message_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendTicketMessageRequest _$SendTicketMessageRequestFromJson(
        Map<String, dynamic> json) =>
    SendTicketMessageRequest(
      ticketId: (json['ticketId'] as num).toInt(),
      body: json['body'] as String,
    );

Map<String, dynamic> _$SendTicketMessageRequestToJson(
        SendTicketMessageRequest instance) =>
    <String, dynamic>{
      'ticketId': instance.ticketId,
      'body': instance.body,
    };
