// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'read_messages_response_entities.g.dart';

@JsonSerializable()
class ReadMessages {
  List<int> messages;
  ReadMessages({
    required this.messages,
  });
  factory ReadMessages.fromJson(Map<String, dynamic> json) =>
      _$ReadMessagesFromJson(json);

  Map<String, dynamic> toJson() => _$ReadMessagesToJson(this);
}
