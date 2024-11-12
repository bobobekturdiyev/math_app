// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayDto _$PayDtoFromJson(Map<String, dynamic> json) => PayDto(
      success: json['success'] as bool,
      message: json['message'] as String,
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$PayDtoToJson(PayDto instance) => <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'code': instance.code,
    };
