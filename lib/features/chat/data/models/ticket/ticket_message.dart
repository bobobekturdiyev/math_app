import 'package:json_annotation/json_annotation.dart';
import 'package:math_app/features/auth/data/models/user.dart';

part 'ticket_message.g.dart';

@JsonSerializable()
class TicketMessageDto {
  final int? id;
  final String? body;

  @JsonKey(name: 'user_id')
  final int? userId;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  final User? user;

  const TicketMessageDto({
    this.id,
    this.body,
    this.userId,
    this.user,
    this.createdAt,
  });

  factory TicketMessageDto.fromJson(Map<String, dynamic> json) =>
      _$TicketMessageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TicketMessageDtoToJson(this);
}
