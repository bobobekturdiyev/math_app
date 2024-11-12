// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_lesson_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowLessonDto _$ShowLessonDtoFromJson(Map<String, dynamic> json) =>
    ShowLessonDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      slug: json['slug'] as String,
      isOpen: json['is_open'] as String,
      videoFiles: (json['videoFiles'] as List<dynamic>)
          .map((e) => VideoDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShowLessonDtoToJson(ShowLessonDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'is_open': instance.isOpen,
      'videoFiles': instance.videoFiles,
    };
