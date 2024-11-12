// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExperienceDto _$ExperienceDtoFromJson(Map<String, dynamic> json) =>
    ExperienceDto(
      id: (json['id'] as num).toInt(),
      portfolioId: (json['portfolio_id'] as num).toInt(),
      title: json['title'] as String,
      fromDate: json['from_date'] as String,
      toDate: json['to_date'] as String,
      companyName: json['company_name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ExperienceDtoToJson(ExperienceDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'portfolio_id': instance.portfolioId,
      'title': instance.title,
      'from_date': instance.fromDate,
      'to_date': instance.toDate,
      'company_name': instance.companyName,
      'description': instance.description,
    };
