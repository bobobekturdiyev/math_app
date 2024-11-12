

import 'package:json_annotation/json_annotation.dart';


part 'response_dto.g.dart';

@JsonSerializable()
class ResponseDto{
  final bool success;
  final String message;
  final int code;








  factory ResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ResponseDtoFromJson(json);

  ResponseDto({required this.success, required this.message, required this.code});

  Map<String, dynamic> toJson() => _$ResponseDtoToJson(this);


}