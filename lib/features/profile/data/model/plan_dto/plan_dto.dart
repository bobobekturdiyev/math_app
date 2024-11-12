

import 'package:json_annotation/json_annotation.dart';

import '../plan_item_dto/plan_item_dto.dart';


part 'plan_dto.g.dart';
@JsonSerializable()
class PlanDto{
final int id;
final String name;
final double price;
final String description;
@JsonKey(name:'is_recommended' )
final int isRecommended;
@JsonKey(name:'expire_date' )
final bool expireDate;
@JsonKey(name:'is_joined' )
final bool isJoined;
@JsonKey(name:'is_active' )
final bool isActive;
@JsonKey(name: 'item_plan')
final List<PlanItemDto> planItem;


factory PlanDto.fromJson(Map<String, dynamic> json) =>
_$PlanDtoFromJson(json);

Map<String, dynamic> toJson() => _$PlanDtoToJson(this);

const PlanDto( {
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.isRecommended,
    required this.expireDate,
    required this.isJoined,
    required this.isActive,
    required this.planItem,
  });
}