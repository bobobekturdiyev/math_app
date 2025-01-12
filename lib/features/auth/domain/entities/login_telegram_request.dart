import 'package:json_annotation/json_annotation.dart';

part 'login_telegram_request.g.dart';

@JsonSerializable()
class LoginTelegramRequest {
  final String otp;

  const LoginTelegramRequest({
    required this.otp,
  });

  factory LoginTelegramRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginTelegramRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginTelegramRequestToJson(this);
}
