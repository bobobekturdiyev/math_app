// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edu_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EduReq _$EduReqFromJson(Map<String, dynamic> json) => EduReq(
      university: json['university_name'] as String,
      website: json['website'] as String,
      fromDate: json['from_date'] as String,
      toDate: json['to_date'] as String,
    );

Map<String, dynamic> _$EduReqToJson(EduReq instance) => <String, dynamic>{
      'university_name': instance.university,
      'website': instance.website,
      'from_date': instance.fromDate,
      'to_date': instance.toDate,
    };
