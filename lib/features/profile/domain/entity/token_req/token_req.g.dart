// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenReq _$TokenReqFromJson(Map<String, dynamic> json) => TokenReq(
      method: json['method'] as String? ?? 'cards.get_verify_code',
      params: Params.fromJson(json['params'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TokenReqToJson(TokenReq instance) => <String, dynamic>{
      'method': instance.method,
      'params': instance.params,
    };
