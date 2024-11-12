// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'award_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AwardReq _$AwardReqFromJson(Map<String, dynamic> json) => AwardReq(
      title: json['title'] as String,
      description: json['description'] as String,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$AwardReqToJson(AwardReq instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'link': instance.link,
    };
