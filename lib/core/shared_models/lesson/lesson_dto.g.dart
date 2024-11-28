// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonDto _$LessonDtoFromJson(Map<String, dynamic> json) => LessonDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      duration: json['duration'] as String,
      hasAccess: (json['has_access'] as num).toInt(),
      isWatched: json['is_watched'] as bool,
      videoUrl: json['video'] as String?,
    );

Map<String, dynamic> _$LessonDtoToJson(LessonDto instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'duration': instance.duration,
      'has_access': instance.hasAccess,
      'is_watched': instance.isWatched,
      'video': instance.videoUrl,
    };
