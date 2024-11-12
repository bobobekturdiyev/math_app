// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyResult _$VerifyResultFromJson(Map<String, dynamic> json) => VerifyResult(
      sent: json['sent'] as bool,
      phone: json['phone'] as String,
      wait: (json['wait'] as num).toInt(),
    );

Map<String, dynamic> _$VerifyResultToJson(VerifyResult instance) =>
    <String, dynamic>{
      'sent': instance.sent,
      'phone': instance.phone,
      'wait': instance.wait,
    };
