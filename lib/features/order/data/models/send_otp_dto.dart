import 'package:json_annotation/json_annotation.dart';

part 'send_otp_dto.g.dart';

@JsonSerializable()
class SendOtpDto {
  final String message;

  final String token;

  const SendOtpDto({
    required this.message,
    required this.token,
  });

  factory SendOtpDto.fromJson(Map<String, dynamic> json) =>
      _$SendOtpDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SendOtpDtoToJson(this);
}
