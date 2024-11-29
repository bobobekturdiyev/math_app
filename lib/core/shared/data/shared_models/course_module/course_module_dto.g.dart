// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_module_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseModuleDto _$CourseModuleDtoFromJson(Map<String, dynamic> json) =>
    CourseModuleDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      position: (json['position'] as num).toInt(),
      lessons: (json['lessons'] as List<dynamic>)
          .map((e) => LessonDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      quiz: json['quiz'] == null
          ? null
          : QuizLightWeightDto.fromJson(json['quiz'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CourseModuleDtoToJson(CourseModuleDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'position': instance.position,
      'lessons': instance.lessons,
      'quiz': instance.quiz,
    };
