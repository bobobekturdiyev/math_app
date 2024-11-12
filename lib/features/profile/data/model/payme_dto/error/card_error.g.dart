// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardError _$CardErrorFromJson(Map<String, dynamic> json) => CardError(
      message: json['message'] as String,
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$CardErrorToJson(CardError instance) => <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
    };
