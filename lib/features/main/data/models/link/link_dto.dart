import 'package:json_annotation/json_annotation.dart';

part 'link_dto.g.dart';

@JsonSerializable()
class LinkDto {
  final int id;
  final String title;
  final String url;
  final String? image;

  LinkDto({
    required this.id,
    required this.title,
    required this.url,
    this.image,
  });

  factory LinkDto.fromJson(Map<String, dynamic> json) =>
      _$LinkDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LinkDtoToJson(this);
}
