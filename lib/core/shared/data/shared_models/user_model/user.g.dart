// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      birthday: json['birthday'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'first_name': instance.name,
      'last_name': instance.lastName,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'birthday': instance.birthday,
      'image': instance.image,
    };
