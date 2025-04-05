import 'package:json_annotation/json_annotation.dart';
import 'package:math_app/features/main/data/models/bot_dto.dart';
import 'package:math_app/features/main/data/models/link/link_dto.dart';

part 'app_dto.g.dart';

@JsonSerializable()
class AppDto {
  final BotDto bot;

  final List<LinkDto> links;

  const AppDto({
    required this.bot,
    required this.links,
  });

  factory AppDto.fromJson(Map<String, dynamic> json) => _$AppDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AppDtoToJson(this);
}
