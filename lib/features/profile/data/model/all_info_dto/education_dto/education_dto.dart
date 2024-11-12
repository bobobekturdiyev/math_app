

import 'package:json_annotation/json_annotation.dart';

part 'education_dto.g.dart';
@JsonSerializable()
class EducationDto{
final int id;
@JsonKey(name: "portfolio_id")
final int portfolioId;
@JsonKey(name: "university_name")
final String universityName;
final String website;
@JsonKey(name: "from_date")
final String fromDate;
@JsonKey(name: "to_date")
final String toDate;




factory EducationDto.fromJson(Map<String, dynamic> json) =>
_$EducationDtoFromJson(json);

Map<String, dynamic> toJson() => _$EducationDtoToJson(this);

const EducationDto({
    required this.id,
    required this.portfolioId,
    required this.universityName,
    required this.website,
    required this.fromDate,
    required this.toDate,
  });
}