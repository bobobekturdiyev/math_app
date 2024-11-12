

import 'package:json_annotation/json_annotation.dart';

part 'update_password_dto.g.dart';
@JsonSerializable()
class UpdatePasswordDto{

final bool success;
final String message;
final int code;





  factory UpdatePasswordDto.fromJson(Map<String, dynamic> json) =>
      _$UpdatePasswordDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatePasswordDtoToJson(this);

const UpdatePasswordDto({
    required this.success,
    required this.message,
    required this.code,
  });
}