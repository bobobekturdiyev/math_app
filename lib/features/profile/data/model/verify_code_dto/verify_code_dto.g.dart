// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_code_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyCodeDto _$VerifyCodeDtoFromJson(Map<String, dynamic> json) =>
    VerifyCodeDto(
      result: VerifyResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VerifyCodeDtoToJson(VerifyCodeDto instance) =>
    <String, dynamic>{
      'result': instance.result,
    };
