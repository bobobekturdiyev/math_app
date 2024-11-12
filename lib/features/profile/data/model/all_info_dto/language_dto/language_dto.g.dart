// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageDto _$LanguageDtoFromJson(Map<String, dynamic> json) => LanguageDto(
      id: (json['id'] as num).toInt(),
      studentId: (json['student_id'] as num).toInt(),
      language: json['language_name'] as String,
      level: json['level'] as String,
    );

Map<String, dynamic> _$LanguageDtoToJson(LanguageDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'student_id': instance.studentId,
      'language_name': instance.language,
      'level': instance.level,
    };
