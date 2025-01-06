
import 'package:json_annotation/json_annotation.dart';


part 'option_dto.g.dart';

@JsonSerializable()
class OptionDto {
  final int id;
  final String text;

  factory OptionDto.fromJson(Map<String, dynamic> json) =>
      _$OptionDtoFromJson(json);

  OptionDto({required this.id, required this.text});



  Map<String, dynamic> toJson() => _$OptionDtoToJson(this);
}

