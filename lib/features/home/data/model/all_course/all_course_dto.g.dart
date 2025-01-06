// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_course_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllCourseDto _$AllCourseDtoFromJson(Map<String, dynamic> json) => AllCourseDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      photo: json['photo'] as String,
      price: (json['price'] as num).toInt(),
      excerpt: json['excerpt'] as String,
      discountedPrice: (json['discounted_price'] as num).toInt(),
    );

Map<String, dynamic> _$AllCourseDtoToJson(AllCourseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'name': instance.name,
      'slug': instance.slug,
      'photo': instance.photo,
      'excerpt': instance.excerpt,
      'discounted_price': instance.discountedPrice,
    };
