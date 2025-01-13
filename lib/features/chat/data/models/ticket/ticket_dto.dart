import 'package:json_annotation/json_annotation.dart';
import 'package:math_app/features/chat/data/models/ticket/ticket_message.dart';

part 'ticket_dto.g.dart';

@JsonSerializable()
class TicketDto {
  final int? id;
  final String? title;

  @JsonKey(name: 'user_id')
  final int? userId;

  final String? status;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'latest_message')
  final TicketMessageDto? message;

  const TicketDto({
    this.id,
    this.title,
    this.userId,
    this.status,
    this.createdAt,
    this.message,
  });

  factory TicketDto.fromJson(Map<String, dynamic> json) =>
      _$TicketDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TicketDtoToJson(this);
}
