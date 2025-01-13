// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketDto _$TicketDtoFromJson(Map<String, dynamic> json) => TicketDto(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      message: json['latest_message'] == null
          ? null
          : TicketMessageDto.fromJson(
              json['latest_message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TicketDtoToJson(TicketDto instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'user_id': instance.userId,
      'status': instance.status,
      'created_at': instance.createdAt,
      'latest_message': instance.message,
    };
