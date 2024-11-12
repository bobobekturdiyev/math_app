import 'package:json_annotation/json_annotation.dart';

part 'video_dto.g.dart';


@JsonSerializable()
class VideoDto{
  final int id;
  final String name;
  @JsonKey(name: 'file_url')
  final String fileUrl;
  final String status;
  final int position;
  @JsonKey(name: 'join_id')
  final int joinId;


  factory VideoDto.fromJson(Map<String, dynamic> json) =>
      _$VideoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoDtoToJson(this);

  const VideoDto({
    required this.id,
    required this.name,
    required this.fileUrl,
    required this.status,
    required this.position,
    required this.joinId,
  });
}





