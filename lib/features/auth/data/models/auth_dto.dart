import 'package:json_annotation/json_annotation.dart';
part 'auth_dto.g.dart';
@JsonSerializable()
class AuthDto{

  final String token;



  const AuthDto({
    required this.token,

  });

  factory AuthDto.fromJson(Map<String, dynamic> json) =>
      _$AuthDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthDtoToJson(this);
}