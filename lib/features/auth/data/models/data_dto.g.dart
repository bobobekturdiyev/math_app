// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataDto _$DataDtoFromJson(Map<String, dynamic> json) => DataDto(
      authorization:
          TokenDto.fromJson(json['authorization'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataDtoToJson(DataDto instance) => <String, dynamic>{
      'authorization': instance.authorization,
    };
