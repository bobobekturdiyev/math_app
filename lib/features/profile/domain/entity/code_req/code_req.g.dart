// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeReq _$CodeReqFromJson(Map<String, dynamic> json) => CodeReq(
      method: json['method'] as String? ?? "cards.verify",
      params: CodeParams.fromJson(json['params'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CodeReqToJson(CodeReq instance) => <String, dynamic>{
      'method': instance.method,
      'params': instance.params,
    };
