// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersDto _$UsersDtoFromJson(Map<String, dynamic> json) => UsersDto(
      user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
      role: json['role'] as String,
      chatId: (json['chat_id'] as num?)?.toInt(),
      hasAccess: json['has_access'] as bool,
      image: json['image'] as String?,
      unread: json['unread'] as bool,
    );

Map<String, dynamic> _$UsersDtoToJson(UsersDto instance) => <String, dynamic>{
      'user': instance.user,
      'role': instance.role,
      'chat_id': instance.chatId,
      'has_access': instance.hasAccess,
      'image': instance.image,
      'unread': instance.unread,
    };
