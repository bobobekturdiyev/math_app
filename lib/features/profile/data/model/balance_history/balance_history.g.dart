// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BalanceHistoryDto _$BalanceHistoryDtoFromJson(Map<String, dynamic> json) =>
    BalanceHistoryDto(
      id: (json['id'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      paymentType: json['payment_type'] as String,
      paymentMethod: json['payment_method'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$BalanceHistoryDtoToJson(BalanceHistoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'payment_type': instance.paymentType,
      'payment_method': instance.paymentMethod,
      'description': instance.description,
    };
