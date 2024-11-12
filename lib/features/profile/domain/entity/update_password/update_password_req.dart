

import 'package:json_annotation/json_annotation.dart';

part 'update_password_req.g.dart';
@JsonSerializable()
class UpdatePasswordReq{
final String password;
@JsonKey(name: "password_confirmation")
final String confirmPassword;





  factory UpdatePasswordReq.fromJson(Map<String, dynamic> json) =>
      _$UpdatePasswordReqFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatePasswordReqToJson(this);

const UpdatePasswordReq({
    required this.password,
    required this.confirmPassword,
  });
}