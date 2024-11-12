// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'push_messages.g.dart';

@JsonSerializable()
class SendMessages {
  String text;
  @JsonKey(name: 'user_id')
  int userId;
  String token;
  SendMessages({required this.text, required this.userId, required this.token});

  factory SendMessages.fromJson(Map<String, dynamic> json) =>
      _$SendMessagesFromJson(json);

  Map<String, dynamic> toJson() => _$SendMessagesToJson(this);
}
