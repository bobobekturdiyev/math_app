import 'package:json_annotation/json_annotation.dart';
import 'package:math_app/features/chat/data/models/user/get_chat_manager/user_dto.dart';

part 'users_dto.g.dart';

@JsonSerializable()
class UsersDto {
  final UserDto user;
  final String role;
  @JsonKey(name: 'chat_id')
  final int? chatId;
  @JsonKey(name: 'has_access')
  bool hasAccess;
  String? image;

  // List<ChatUserDto> chatUserDto;
  bool unread;

  UsersDto({
    required this.user,
    required this.role,
    required this.chatId,
    required this.hasAccess,
    required this.image,
    required this.unread,
    // required this.chatUserDto
  });

  factory UsersDto.fromJson(Map<String, dynamic> json) =>
      _$UsersDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UsersDtoToJson(this);
}
