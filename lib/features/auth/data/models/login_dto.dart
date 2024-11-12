import 'package:json_annotation/json_annotation.dart';
import 'package:math_app/features/auth/data/models/data_dto.dart';

part 'login_dto.g.dart';


@JsonSerializable()
class LoginDto{

  final bool success;
  final String? message;
  final DataDto? data;
  final int code;



  const LoginDto({
    required this.success,
    required this.message,
    this.data,
    required this.code,
  });

  factory LoginDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDtoToJson(this);
}