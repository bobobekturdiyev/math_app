import 'package:json_annotation/json_annotation.dart';
import 'package:math_app/features/auth/data/models/token_dto.dart';



part 'data_dto.g.dart';
@JsonSerializable()
class DataDto{
   final TokenDto authorization;


  const DataDto({
    required this.authorization,

  });

  factory DataDto.fromJson(Map<String, dynamic> json) =>
      _$DataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DataDtoToJson(this);
}

