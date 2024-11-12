// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageType _$MessageTypeFromJson(Map<String, dynamic> json) => MessageType(
      id: (json['id'] as num).toInt(),
      senderType: json['sender_type'] as String,
      chatId: (json['chat_id'] as num).toInt(),
      text: json['text'] as String,
      isRead: json['is_read'] as bool,
      fileUrl: json['file_url'] as String?,
      token: json['token'] as String?,
      time: json['time'] as String,
      fullTime: json['full_time'] as String,
    );

Map<String, dynamic> _$MessageTypeToJson(MessageType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sender_type': instance.senderType,
      'chat_id': instance.chatId,
      'text': instance.text,
      'is_read': instance.isRead,
      'file_url': instance.fileUrl,
      'token': instance.token,
      'time': instance.time,
      'full_time': instance.fullTime,
    };
