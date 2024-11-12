// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseDto _$CourseDtoFromJson(Map<String, dynamic> json) => CourseDto(
      id: (json['id'] as num).toInt(),
      courseId: (json['course_id'] as num).toInt(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$CourseDtoToJson(CourseDto instance) => <String, dynamic>{
      'id': instance.id,
      'course_id': instance.courseId,
      'status': instance.status,
    };
