// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_otp_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendOtpDto _$SendOtpDtoFromJson(Map<String, dynamic> json) => SendOtpDto(
      message: json['message'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$SendOtpDtoToJson(SendOtpDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
    };
