// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_messages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendMessages _$SendMessagesFromJson(Map<String, dynamic> json) => SendMessages(
      text: json['text'] as String,
      userId: (json['user_id'] as num).toInt(),
      token: json['token'] as String,
    );

Map<String, dynamic> _$SendMessagesToJson(SendMessages instance) =>
    <String, dynamic>{
      'text': instance.text,
      'user_id': instance.userId,
      'token': instance.token,
    };
