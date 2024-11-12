import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  final String name;
  final String surname;
  @JsonKey(name: 'user_id')
  final int userId;
  UserDto({
    required this.name,
    required this.surname,
    required this.userId,
  });
  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
