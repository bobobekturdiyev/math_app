// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
part 'message.g.dart';
@JsonSerializable()
class MessageType {
  final int id;
  @JsonKey(name: 'sender_type')
  final String senderType;

  @JsonKey(name: 'chat_id')
  final int chatId;

  final String text;

  @JsonKey(name: 'is_read')
  final bool isRead;

  @JsonKey(name: 'file_url')
  final String? fileUrl;

  final String? token;

  final String time;

  @JsonKey(name: 'full_time')
  final String fullTime;
  MessageType({
    required this.id,
    required this.senderType,
    required this.chatId,
    required this.text,
    required this.isRead,
    this.fileUrl,
    this.token,
    required this.time,
    required this.fullTime,
  });

@override
  String toString() {
    return 'Message {'
        'id: $id, '
        'senderType: $senderType, '
        'chatId: $chatId, '
        'text: $text, '
        'isRead: $isRead, '
        'fileUrl: $fileUrl, '
        'token: $token, '
        'time: $time, '
        'fullTime: $fullTime'
        '}';
  }
  
  

  factory MessageType.fromJson(Map<String, dynamic> json) =>
      _$MessageTypeFromJson(json);

  Map<String, dynamic> toJson() => _$MessageTypeToJson(this);
}
