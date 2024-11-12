// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatUserDto _$ChatUserDtoFromJson(Map<String, dynamic> json) => ChatUserDto(
      senderType: json['sender_type'] as String,
      text: json['text'] as String,
      time: json['time'] as String,
      id: (json['id'] as num).toInt(),
      isRead: (json['is_read'] as num).toInt(),
      chatId: (json['chat_id'] as num).toInt(),
    );

Map<String, dynamic> _$ChatUserDtoToJson(ChatUserDto instance) =>
    <String, dynamic>{
      'sender_type': instance.senderType,
      'text': instance.text,
      'time': instance.time,
      'id': instance.id,
      'chat_id': instance.chatId,
      'is_read': instance.isRead,
    };
