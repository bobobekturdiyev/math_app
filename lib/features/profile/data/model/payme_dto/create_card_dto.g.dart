// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_card_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardCreateDto _$CardCreateDtoFromJson(Map<String, dynamic> json) =>
    CardCreateDto(
      result: json['result'] == null
          ? null
          : CardSuccess.fromJson(json['result'] as Map<String, dynamic>),
      error: json['error'] == null
          ? null
          : CardError.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CardCreateDtoToJson(CardCreateDto instance) =>
    <String, dynamic>{
      'result': instance.result,
      'error': instance.error,
    };
