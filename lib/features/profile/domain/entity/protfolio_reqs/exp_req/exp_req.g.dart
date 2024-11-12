// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exp_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpReq _$ExpReqFromJson(Map<String, dynamic> json) => ExpReq(
      title: json['title'] as String,
      fromDate: json['from_date'] as String,
      toDate: json['to_date'] as String,
      compName: json['company_name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ExpReqToJson(ExpReq instance) => <String, dynamic>{
      'title': instance.title,
      'from_date': instance.fromDate,
      'to_date': instance.toDate,
      'company_name': instance.compName,
      'description': instance.description,
    };
