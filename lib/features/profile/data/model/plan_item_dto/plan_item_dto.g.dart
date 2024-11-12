// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanItemDto _$PlanItemDtoFromJson(Map<String, dynamic> json) => PlanItemDto(
      text: json['text'] as String,
      checkBox: (json['check_box'] as num).toInt(),
    );

Map<String, dynamic> _$PlanItemDtoToJson(PlanItemDto instance) =>
    <String, dynamic>{
      'text': instance.text,
      'check_box': instance.checkBox,
    };
