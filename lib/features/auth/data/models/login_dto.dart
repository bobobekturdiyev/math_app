import 'package:json_annotation/json_annotation.dart';
import 'package:math_app/features/auth/data/models/user.dart';

part 'login_dto.g.dart';

@JsonSerializable()
class UserDto {
  final String token;
  final User user;

  const UserDto({
    required this.token,
    required this.user,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
