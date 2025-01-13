// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketMessageDto _$TicketMessageDtoFromJson(Map<String, dynamic> json) =>
    TicketMessageDto(
      id: (json['id'] as num?)?.toInt(),
      body: json['body'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$TicketMessageDtoToJson(TicketMessageDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'body': instance.body,
      'user_id': instance.userId,
      'created_at': instance.createdAt,
      'user': instance.user,
    };
