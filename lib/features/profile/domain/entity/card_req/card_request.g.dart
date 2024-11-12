// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardRequest _$CardRequestFromJson(Map<String, dynamic> json) => CardRequest(
      card: CardData.fromJson(json['card'] as Map<String, dynamic>),
      save: json['save'] as bool,
    );

Map<String, dynamic> _$CardRequestToJson(CardRequest instance) =>
    <String, dynamic>{
      'card': instance.card,
      'save': instance.save,
    };
