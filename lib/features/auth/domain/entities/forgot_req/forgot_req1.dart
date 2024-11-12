import 'package:json_annotation/json_annotation.dart';


part 'forgot_req1.g.dart';
@JsonSerializable()
class ForgotOneReq{
  final int value;
  factory ForgotOneReq.fromJson(Map<String, dynamic> json) =>
      _$ForgotOneReqFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotOneReqToJson(this);

  const ForgotOneReq({
    required this.value,
  });
}