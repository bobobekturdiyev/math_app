// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_course_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyCourseDto _$MyCourseDtoFromJson(Map<String, dynamic> json) => MyCourseDto(
      name: json['name'] as String,
      author: json['author'] as String,
      duration: json['duration'] as String,
      photo: json['photo'] as String,
      slug: json['slug'] as String,
      totalLessons: (json['total_lessons'] as num).toInt(),
      completedLessons: (json['completed_lessons'] as num).toInt(),
      completedPercentage: (json['completed_percentage'] as num).toInt(),
    );

Map<String, dynamic> _$MyCourseDtoToJson(MyCourseDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'author': instance.author,
      'duration': instance.duration,
      'photo': instance.photo,
      'slug': instance.slug,
      'total_lessons': instance.totalLessons,
      'completed_lessons': instance.completedLessons,
      'completed_percentage': instance.completedPercentage,
    };
