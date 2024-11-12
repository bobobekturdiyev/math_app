// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Card _$CardFromJson(Map<String, dynamic> json) => Card(
      number: json['number'] as String,
      expire: json['expire'] as String,
      token: json['token'] as String,
      recurrent: json['recurrent'] as bool,
      verify: json['verify'] as bool,
      type: json['type'] as String,
    );

Map<String, dynamic> _$CardToJson(Card instance) => <String, dynamic>{
      'number': instance.number,
      'expire': instance.expire,
      'token': instance.token,
      'recurrent': instance.recurrent,
      'verify': instance.verify,
      'type': instance.type,
    };
