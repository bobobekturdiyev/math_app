import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_dto.g.dart';

@JsonSerializable()
class VerifyOtpDto {
  final String message;

  const VerifyOtpDto({
    required this.message,
  });

  factory VerifyOtpDto.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpDtoFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyOtpDtoToJson(this);
}
