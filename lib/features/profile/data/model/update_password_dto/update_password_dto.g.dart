// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_password_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePasswordDto _$UpdatePasswordDtoFromJson(Map<String, dynamic> json) =>
    UpdatePasswordDto(
      success: json['success'] as bool,
      message: json['message'] as String,
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$UpdatePasswordDtoToJson(UpdatePasswordDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'code': instance.code,
    };
