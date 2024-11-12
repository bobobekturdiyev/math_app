// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EducationDto _$EducationDtoFromJson(Map<String, dynamic> json) => EducationDto(
      id: (json['id'] as num).toInt(),
      portfolioId: (json['portfolio_id'] as num).toInt(),
      universityName: json['university_name'] as String,
      website: json['website'] as String,
      fromDate: json['from_date'] as String,
      toDate: json['to_date'] as String,
    );

Map<String, dynamic> _$EducationDtoToJson(EducationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'portfolio_id': instance.portfolioId,
      'university_name': instance.universityName,
      'website': instance.website,
      'from_date': instance.fromDate,
      'to_date': instance.toDate,
    };
