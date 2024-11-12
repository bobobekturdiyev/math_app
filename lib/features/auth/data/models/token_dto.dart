import 'package:json_annotation/json_annotation.dart';

part 'token_dto.g.dart';
@JsonSerializable()
class TokenDto{
final String token;
final String type;

const TokenDto({
  required this.token,
  required this.type,
});

  factory TokenDto.fromJson(Map<String, dynamic> json) =>
      _$TokenDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TokenDtoToJson(this);


}