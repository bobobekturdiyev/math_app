import 'package:json_annotation/json_annotation.dart';

import 'auth_dto.dart';
part 'register_dto.g.dart';
@JsonSerializable()
class RegisterDto{

  final bool success;
  final String message;
  final AuthDto? data;
  final int code;

  const RegisterDto({
    required this.success,
    required this.message,
    this.data,
    required this.code,
  });

  factory RegisterDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterDtoToJson(this);
}