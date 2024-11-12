import 'package:json_annotation/json_annotation.dart';


part 'forgot_request.g.dart';
@JsonSerializable()
class ForgotReq{


  final int value;
  final String password;
  @JsonKey(name: "password_confirmation")
  final String passwordConfirm;

  const ForgotReq({
    required this.value,
    required this.password,
    required this.passwordConfirm,
  });


  factory ForgotReq.fromJson(Map<String, dynamic> json) =>
      _$ForgotReqFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotReqToJson(this);


}