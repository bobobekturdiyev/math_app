// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseDto _$CourseDtoFromJson(Map<String, dynamic> json) => CourseDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      author: json['author'] as String,
      slug: json['slug'] as String,
      isSold: json['is_sold'] as bool,
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'] as String,
      modules: (json['modules'] as List<dynamic>)
          .map((e) => CourseModuleDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      discountedPrice: (json['discounted_price'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CourseDtoToJson(CourseDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'author': instance.author,
      'slug': instance.slug,
      'is_sold': instance.isSold,
      'price': instance.price,
      'description': instance.description,
      'modules': instance.modules,
      'discounted_price': instance.discountedPrice,
    };
