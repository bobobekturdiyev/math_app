// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_pay_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardPayReq _$CardPayReqFromJson(Map<String, dynamic> json) => CardPayReq(
      method: json['method'] as String,
      params: CardRequest.fromJson(json['params'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CardPayReqToJson(CardPayReq instance) =>
    <String, dynamic>{
      'method': instance.method,
      'params': instance.params,
    };
