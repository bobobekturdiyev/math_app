import 'package:json_annotation/json_annotation.dart';
import 'package:math_app/features/auth/data/models/authorization.dart';
import 'package:math_app/features/auth/data/models/user.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final User user;
  final Authorization authorization;

  const LoginResponse({
    required this.user,
    required this.authorization,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
