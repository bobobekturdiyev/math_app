import 'package:json_annotation/json_annotation.dart';

part 'bot_dto.g.dart';

@JsonSerializable()
class BotDto {
  final int id;
  @JsonKey(name: 'first_name')
  final String name;
  final String username;

  const BotDto({
    required this.id,
    required this.name,
    required this.username,
  });

  factory BotDto.fromJson(Map<String, dynamic> json) => _$BotDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BotDtoToJson(this);
}
