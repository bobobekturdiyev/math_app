import 'package:json_annotation/json_annotation.dart';

part 'check_token_request.g.dart';

@JsonSerializable()
class CheckTokenRequest {
  final String token;

  const CheckTokenRequest({
    required this.token,
  });

  factory CheckTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$CheckTokenRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CheckTokenRequestToJson(this);
}
