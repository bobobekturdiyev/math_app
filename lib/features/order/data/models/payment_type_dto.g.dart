// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_type_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentTypeDto _$PaymentTypeDtoFromJson(Map<String, dynamic> json) =>
    PaymentTypeDto(
      value: json['value'] as String,
      values:
          (json['values'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PaymentTypeDtoToJson(PaymentTypeDto instance) =>
    <String, dynamic>{
      'value': instance.value,
      'values': instance.values,
    };
