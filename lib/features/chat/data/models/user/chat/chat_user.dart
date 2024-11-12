// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'chat_user.g.dart';

@JsonSerializable()
class ChatUserDto {
  @JsonKey(name: 'sender_type')
  final String senderType;
  final String text;
  final String time;
  final int id;
  @JsonKey(name: 'chat_id')
  final int chatId;
  @JsonKey(name: 'is_read')
  final int isRead;
  ChatUserDto({
    required this.senderType,
    required this.text,
    required this.time,
    required this.id,
    required this.isRead,
    required this.chatId,
  });
  factory ChatUserDto.fromJson(Map<String, dynamic> json) =>
      _$ChatUserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ChatUserDtoToJson(this);
}
