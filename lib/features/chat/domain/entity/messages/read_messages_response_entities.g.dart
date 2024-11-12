// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_messages_response_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReadMessages _$ReadMessagesFromJson(Map<String, dynamic> json) => ReadMessages(
      messages: (json['messages'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$ReadMessagesToJson(ReadMessages instance) =>
    <String, dynamic>{
      'messages': instance.messages,
    };
