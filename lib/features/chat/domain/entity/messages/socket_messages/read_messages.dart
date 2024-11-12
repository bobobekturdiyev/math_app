import 'package:json_annotation/json_annotation.dart';
part 'read_messages.g.dart';

@JsonSerializable()
class ReadMessageType {
  @JsonKey(name: 'message_ids')
  final List<dynamic> messageIds;
  ReadMessageType({
    required this.messageIds,
  });
  @override
  String toString() {
    return 'Message {'
        'messageIds: $messageIds, '
        '}';
  }

  factory ReadMessageType.fromJson(Map<String, dynamic> json) =>
      _$ReadMessageTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ReadMessageTypeToJson(this);
}
