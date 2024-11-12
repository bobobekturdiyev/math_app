// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_req2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgotTwoReq _$ForgotTwoReqFromJson(Map<String, dynamic> json) => ForgotTwoReq(
      value: (json['value'] as num).toInt(),
      code: (json['verify_code'] as num).toInt(),
    );

Map<String, dynamic> _$ForgotTwoReqToJson(ForgotTwoReq instance) =>
    <String, dynamic>{
      'value': instance.value,
      'verify_code': instance.code,
    };
