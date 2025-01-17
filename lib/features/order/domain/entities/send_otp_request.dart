import 'package:json_annotation/json_annotation.dart';

part 'send_otp_request.g.dart';

@JsonSerializable()
class SendOtpRequest {
  @JsonKey(name: 'card_number')
  final String cardNumber;

  @JsonKey(name: 'expire_date')
  final String expireDate;

  const SendOtpRequest({
    required this.cardNumber,
    required this.expireDate,
  });

  factory SendOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$SendOtpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SendOtpRequestToJson(this);
}
