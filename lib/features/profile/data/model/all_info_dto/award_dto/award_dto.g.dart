// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'award_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AwardDto _$AwardDtoFromJson(Map<String, dynamic> json) => AwardDto(
      id: (json['id'] as num).toInt(),
      portfolioId: (json['portfolio_id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      link: json['link'] as String,
    );

Map<String, dynamic> _$AwardDtoToJson(AwardDto instance) => <String, dynamic>{
      'id': instance.id,
      'portfolio_id': instance.portfolioId,
      'title': instance.title,
      'description': instance.description,
      'link': instance.link,
    };
