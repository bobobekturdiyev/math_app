// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseDetailsDto _$CourseDetailsDtoFromJson(Map<String, dynamic> json) =>
    CourseDetailsDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      hasAccess: json['has_access'] as bool? ?? false,
      slug: json['slug'] as String,
      excerpt: json['excerpt'] as String,
      description: json['description'] as String,
      imageUrl: json['photo_url'] as String,
      trailer: json['trailer'] as String,
      level: json['level'] as String,
      duration: json['duration'] as String,
      enrollments: (json['enrollments'] as num).toInt(),
      lessonNumber: (json['lessons_number'] as num).toInt(),
    );

Map<String, dynamic> _$CourseDetailsDtoToJson(CourseDetailsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'has_access': instance.hasAccess,
      'slug': instance.slug,
      'excerpt': instance.excerpt,
      'description': instance.description,
      'photo_url': instance.imageUrl,
      'trailer': instance.trailer,
      'level': instance.level,
      'duration': instance.duration,
      'enrollments': instance.enrollments,
      'lessons_number': instance.lessonNumber,
    };
