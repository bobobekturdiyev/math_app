// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_course_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllCourseDto _$AllCourseDtoFromJson(Map<String, dynamic> json) => AllCourseDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      slug: json['slug'] as String,
      excerpt: json['excerpt'] as String,
      imageUrl: json['photo_url'] as String,
      level: json['level'] as String,
      duration: json['duration'] as String,
      enrollments: (json['enrollments'] as num).toInt(),
    );

Map<String, dynamic> _$AllCourseDtoToJson(AllCourseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'excerpt': instance.excerpt,
      'photo_url': instance.imageUrl,
      'level': instance.level,
      'duration': instance.duration,
      'enrollments': instance.enrollments,
    };
