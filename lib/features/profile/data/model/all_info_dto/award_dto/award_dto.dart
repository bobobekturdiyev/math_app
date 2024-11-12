



import 'package:json_annotation/json_annotation.dart';

part 'award_dto.g.dart';
@JsonSerializable()
class AwardDto{
final int id;
@JsonKey(name: "portfolio_id")
final int portfolioId;
final String title;
final String description;
final String link;





factory AwardDto.fromJson(Map<String, dynamic> json) =>
_$AwardDtoFromJson(json);

Map<String, dynamic> toJson() => _$AwardDtoToJson(this);

const AwardDto({
    required this.id,
    required this.portfolioId,
    required this.title,
    required this.description,
    required this.link,
  });
}