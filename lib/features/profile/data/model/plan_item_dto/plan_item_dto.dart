

import 'package:json_annotation/json_annotation.dart';


part 'plan_item_dto.g.dart';
@JsonSerializable()
class PlanItemDto{
  final String text;
  @JsonKey(name: "check_box")
  final int checkBox;


  factory PlanItemDto.fromJson(Map<String, dynamic> json) =>
      _$PlanItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PlanItemDtoToJson(this);

  const PlanItemDto({
    required this.text,
    required this.checkBox,
  });
}