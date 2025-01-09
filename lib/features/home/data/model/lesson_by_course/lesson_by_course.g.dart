// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_by_course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonByCourseDto _$LessonByCourseDtoFromJson(Map<String, dynamic> json) =>
    LessonByCourseDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      position: (json['position'] as num?)?.toInt(),
      lesson: (json['lesson'] as List<dynamic>)
          .map((e) => LessonShortDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LessonByCourseDtoToJson(LessonByCourseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'position': instance.position,
      'lesson': instance.lesson,
    };
