// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      surname: json['surname'] as String,
      balance: (json['balance'] as num).toInt(),
      phone: json['phone'] as String,
      about: json['about'] as String?,
      email: json['email'] as String?,
      studentId: json['student_id'] as String,
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'balance': instance.balance,
      'email': instance.email,
      'phone': instance.phone,
      'about': instance.about,
      'student_id': instance.studentId,
    };
