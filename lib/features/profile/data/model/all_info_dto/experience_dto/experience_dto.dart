

import 'package:json_annotation/json_annotation.dart';

part 'experience_dto.g.dart';
@JsonSerializable()
class ExperienceDto{
  final int id;
  @JsonKey(name: "portfolio_id")
  final int portfolioId;
  final String title;
  @JsonKey(name: 'from_date')
  final String fromDate;
  @JsonKey(name: 'to_date')
  final String toDate;
  @JsonKey(name: 'company_name')
  final String companyName;
  final String description;







  factory ExperienceDto.fromJson(Map<String, dynamic> json) =>
      _$ExperienceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExperienceDtoToJson(this);

  const ExperienceDto({
    required this.id,
    required this.portfolioId,
    required this.title,
    required this.fromDate,
    required this.toDate,
    required this.companyName,
    required this.description,
  });

}