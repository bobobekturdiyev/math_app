// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_password_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePasswordReq _$UpdatePasswordReqFromJson(Map<String, dynamic> json) =>
    UpdatePasswordReq(
      password: json['password'] as String,
      confirmPassword: json['password_confirmation'] as String,
    );

Map<String, dynamic> _$UpdatePasswordReqToJson(UpdatePasswordReq instance) =>
    <String, dynamic>{
      'password': instance.password,
      'password_confirmation': instance.confirmPassword,
    };
