// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgotReq _$ForgotReqFromJson(Map<String, dynamic> json) => ForgotReq(
      value: (json['value'] as num).toInt(),
      password: json['password'] as String,
      passwordConfirm: json['password_confirmation'] as String,
    );

Map<String, dynamic> _$ForgotReqToJson(ForgotReq instance) => <String, dynamic>{
      'value': instance.value,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirm,
    };
