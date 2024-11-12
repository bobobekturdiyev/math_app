// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayRequest _$PayRequestFromJson(Map<String, dynamic> json) => PayRequest(
      planId: (json['plan_id'] as num).toInt(),
    );

Map<String, dynamic> _$PayRequestToJson(PayRequest instance) =>
    <String, dynamic>{
      'plan_id': instance.planId,
    };
