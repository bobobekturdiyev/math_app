// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skills_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SkillsReq _$SkillsReqFromJson(Map<String, dynamic> json) => SkillsReq(
      tags: (json['tags'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$SkillsReqToJson(SkillsReq instance) => <String, dynamic>{
      'tags': instance.tags,
    };
