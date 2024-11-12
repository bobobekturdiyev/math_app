// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanDto _$PlanDtoFromJson(Map<String, dynamic> json) => PlanDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      isRecommended: (json['is_recommended'] as num).toInt(),
      expireDate: json['expire_date'] as bool,
      isJoined: json['is_joined'] as bool,
      isActive: json['is_active'] as bool,
      planItem: (json['item_plan'] as List<dynamic>)
          .map((e) => PlanItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlanDtoToJson(PlanDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'is_recommended': instance.isRecommended,
      'expire_date': instance.expireDate,
      'is_joined': instance.isJoined,
      'is_active': instance.isActive,
      'item_plan': instance.planItem,
    };
