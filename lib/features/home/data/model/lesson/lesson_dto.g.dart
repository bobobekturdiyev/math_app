// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonDto _$LessonDtoFromJson(Map<String, dynamic> json) => LessonDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      isOpen: json['is_open'] as String,
      slug: json['slug'] as String,
      price: (json['price'] as num?)?.toInt(),
      position: (json['position'] as num?)?.toInt(),
      lessonJoinCategoryId: (json['lesson_join_category_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LessonDtoToJson(LessonDto instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'price': instance.price,
      'position': instance.position,
      'is_open': instance.isOpen,
      'lesson_join_category_id': instance.lessonJoinCategoryId,
    };
