import 'package:json_annotation/json_annotation.dart';


part 'forgot_req2.g.dart';
@JsonSerializable()
class ForgotTwoReq{
  final int value;
  @JsonKey(name: 'verify_code')
  final int code;
  factory ForgotTwoReq.fromJson(Map<String, dynamic> json) =>
      _$ForgotTwoReqFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotTwoReqToJson(this);

  const ForgotTwoReq({
    required this.value,
    required this.code
  });
}