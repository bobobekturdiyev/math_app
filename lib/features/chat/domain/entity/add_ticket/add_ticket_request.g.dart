// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_ticket_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddTicketRequest _$AddTicketRequestFromJson(Map<String, dynamic> json) =>
    AddTicketRequest(
      title: json['title'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$AddTicketRequestToJson(AddTicketRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
    };
