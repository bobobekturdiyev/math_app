// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageReq _$LanguageReqFromJson(Map<String, dynamic> json) => LanguageReq(
      lang: json['language_name'] as String,
      level: json['level'] as String,
    );

Map<String, dynamic> _$LanguageReqToJson(LanguageReq instance) =>
    <String, dynamic>{
      'language_name': instance.lang,
      'level': instance.level,
    };
